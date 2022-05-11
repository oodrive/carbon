import 'dart:convert';
import 'dart:typed_data';

import 'package:beamer/beamer.dart';
import 'package:carbon/common/extensions.dart';
import 'package:carbon/common/scope_pie_chart.dart';
import 'package:carbon/common/widgets.dart';
import 'package:carbon/gen/assets.gen.dart';
import 'package:carbon/gen/colors.gen.dart';
import 'package:carbon/model/organization.dart';
import 'package:carbon/translations/gen/l10n.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Stack(
        children: [
          const GreenHeader(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                actions: const [_HomeMenuButton()],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 32, right: 48),
                child: Text(
                  Translation.current.yourOrganizationsTitle,
                  style: context.textTheme.headline4?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 350,
                child: Builder(
                  builder: (context) {
                    final state = context.watch<OrganizationsState>();

                    return AutoAnimList(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(16),
                      children: [
                        ...state.organizations.map((orga) => _OrganizationItem(key: ValueKey(orga), orga: orga)),
                        AddButton(
                          onTap: () {
                            _showOrganizationCreationDialog(context, state, (newOrga) {
                              state.add(newOrga);
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Translation.current.whoIsConcernedTitle,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(16),
                    AutoLinkMarkdown(data: Translation.current.whoIsConcernedDescription),
                    const Gap(48),
                    Text(
                      Translation.current.whyReduceFootprintTitle,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(16),
                    AutoLinkMarkdown(data: Translation.current.whyReduceFootprintDescription),
                    const Gap(48),
                    Text(
                      Translation.current.neededEffortTitle,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(16),
                    AutoLinkMarkdown(data: Translation.current.neededEffortDescription),
                    const Gap(48),
                    Text(
                      Translation.current.dataConfidentialityTitle,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(16),
                    AutoLinkMarkdown(data: Translation.current.dataConfidentialityDescription),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OrganizationItem extends StatelessWidget {
  const _OrganizationItem({
    Key? key,
    required this.orga,
  }) : super(key: key);

  final Organization orga;

  @override
  Widget build(BuildContext context) {
    return GreenHeaderItem(
      onTap: () => context.beamToNamed('/${orga.id}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Assets.organization.svg(
              height: 96,
            ),
          ),
          const Gap(12),
          Text(
            orga.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Gap(4),
          Text(
            orga.year.toString(),
            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          MiniScopesPieChart(
            scope1Footprint: orga.scope1tCO2e(),
            scope2Footprint: orga.scope2tCO2e(),
            scope3Footprint: orga.scope3tCO2e(),
          ),
        ],
      ),
    );
  }
}

class _HomeMenuButton extends StatelessWidget {
  const _HomeMenuButton();

  @override
  Widget build(BuildContext context) {
    return SimpleMenuButton(
      items: [
        SimpleMenuItem(
          text: Translation.current.exportData,
          icon: Icons.save_outlined,
          onTap: () {
            final state = context.read<OrganizationsState>();

            const jsonEncoder = JsonEncoder.withIndent('  ');
            final json = jsonEncoder.convert(OrganizationList(state.organizations).toJson());
            final now = DateTime.now();
            final date = '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
            FileSaver.instance.saveFile(
              'carbon_data_$date',
              Uint8List.fromList(utf8.encode(json)),
              'json',
              mimeType: MimeType.JSON,
            );
          },
        ),
        SimpleMenuItem(
          text: Translation.current.importData,
          icon: Icons.upload_outlined,
          onTap: () async {
            final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['json']);

            // Check if user didn't canceled the picker
            if (result != null) {
              // ignore: use_build_context_synchronously
              final state = context.read<OrganizationsState>();

              try {
                final json = utf8.decode(result.files.single.bytes!.toList());
                final organizations = OrganizationList.fromJson(jsonDecode(json) as Map<String, dynamic>).organizations;
                state.addAll(organizations);
              } catch (_) {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: ColorName.lightGreen,
                  content: Text(Translation.current.exportDataError),
                );
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
        ),
        SimpleMenuItem(
          text: Translation.current.about,
          icon: Icons.help_outline,
          onTap: () {
            _showAboutDialog(context);
          },
        ),
      ],
    );
  }
}

Future _showOrganizationCreationDialog(BuildContext context, OrganizationsState state, Function(Organization o) onValidation) {
  final nameController = TextEditingController();
  final yearController = TextEditingController();

  var nameError = false;
  var yearError = false;

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void submit() {
            if (nameController.text.isEmpty || yearController.text.length != 4) {
              setState(() {
                nameError = nameController.text.isEmpty;
                yearError = yearController.text.length != 4;
              });
            } else {
              Navigator.pop(context);
              onValidation(Organization(name: nameController.text, year: int.parse(yearController.text)));
            }
          }

          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            actionsPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            title: Text(Translation.current.createOrganizationTitle),
            content: DialogColumn(
              children: [
                TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: Translation.current.name,
                      errorText: nameError ? Translation.current.nameError : null,
                    ),
                    controller: nameController,
                  ),
                  hideOnEmpty: true,
                  hideOnLoading: true,
                  suggestionsCallback: (pattern) {
                    return pattern.isEmpty
                        ? <String>[]
                        : state.organizations
                            .where((o) => o.name.toLowerCase().startsWith(pattern.toLowerCase()))
                            .map((o) => o.name)
                            .toSet();
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.toString()),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    nameController.text = suggestion.toString();
                  },
                ),
                const Gap(16),
                TextField(
                  decoration: InputDecoration(
                    labelText: Translation.current.year,
                    errorText: yearError ? Translation.current.yearError : null,
                  ),
                  controller: yearController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]*'))],
                  onSubmitted: (_) {
                    submit();
                  },
                ),
              ],
            ),
            actions: [
              const CancelButton(),
              ElevatedButton(
                onPressed: submit,
                child: Text(MaterialLocalizations.of(context).okButtonLabel),
              ),
            ],
          );
        },
      );
    },
  );
}

Future _showAboutDialog(BuildContext context) => showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          actionsPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          title: Text(Translation.current.about),
          content: DialogColumn(
            children: [
              AutoLinkMarkdown(data: Translation.current.aboutDescription),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
            ),
          ],
        );
      },
    );
