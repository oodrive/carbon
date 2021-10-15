import 'package:beamer/beamer.dart';
import 'package:carbon/translations/gen/l10n.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'common/advices.dart';
import 'common/extensions.dart';
import 'common/scope_pie_chart.dart';
import 'common/widgets.dart';
import 'gen/assets.gen.dart';
import 'model/organization.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OrganizationsState>();

    final Organization orga;
    try {
      final beamState = context.currentBeamLocation.state as BeamState;
      final organizationId = beamState.pathParameters['organizationId'];
      orga = state.organizations.firstWhere((o) => o.id == organizationId);
    } catch (_) {
      // handle exception by returning to home
      context.beamToNamed('/');
      return const Scaffold();
    }

    return ScreenTemplate(
      child: Stack(
        children: [
          const GreenHeader(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: Text('${orga.name} (${orga.year})'),
                backgroundColor: Colors.transparent,
                actions: [_OrganizationMenuButton(state: state, orga: orga)],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 32, right: 48),
                child: Text(
                  Translation.current.yourSitesTitle,
                  style: context.textTheme.headline4?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 350,
                child: AutoAnimList(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(16),
                  children: [
                    ...orga.sites.map((site) => _SiteItem(key: ValueKey(site), organizationId: orga.id, site: site)),
                    AddButton(
                      onTap: () {
                        _showSiteCreationDialog(context, (s) {
                          orga.addSite(s);
                          state.update();
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Translation.current.organizationFootprintTitle,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(16),
                    ScopesPieChart(
                      scope1Footprint: orga.scope1tCO2e(),
                      scope2Footprint: orga.scope2tCO2e(),
                      scope3Footprint: orga.scope3tCO2e(),
                    ),
                    const Gap(48),
                    Text(
                      Translation.current.howToReduceFootprint,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(24),
                    Advices(sites: orga.sites),
                    const Gap(48),
                    Text(
                      Translation.current.estimationCommunicationTitle,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(16),
                    AutoLinkMarkdown(data: Translation.current.estimationCommunicationDescription),
                    const Gap(48),
                    Text(
                      Translation.current.compensationTitle,
                      style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(16),
                    AutoLinkMarkdown(data: Translation.current.compensationDescription),
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

class _SiteItem extends StatelessWidget {
  const _SiteItem({
    Key? key,
    required this.organizationId,
    required this.site,
  }) : super(key: key);

  final String organizationId;
  final Site site;

  @override
  Widget build(BuildContext context) {
    return GreenHeaderItem(
      onTap: () => context.beamToNamed('/$organizationId/${site.id}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Assets.site.svg(
              height: 96,
            ),
          ),
          const Gap(16),
          Text(
            site.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Gap(16),
          MiniScopesPieChart(
            scope1Footprint: site.scope1.tCO2e(),
            scope2Footprint: site.scope2.tCO2e(),
            scope3Footprint: site.scope3.tCO2e(),
          ),
        ],
      ),
    );
  }
}

class _OrganizationMenuButton extends StatelessWidget {
  const _OrganizationMenuButton({
    Key? key,
    required this.state,
    required this.orga,
  }) : super(key: key);

  final OrganizationsState state;
  final Organization orga;

  @override
  Widget build(BuildContext context) {
    return SimpleMenuButton(
      items: [
        SimpleMenuItem(
          text: Translation.current.deleteOrganization,
          icon: Icons.delete_outline,
          iconColor: Colors.red[300],
          onTap: () {
            showValidationDialog(context, () {
              Navigator.pop(context);
              Future<void>.delayed(400.milliseconds).then((_) => state.delete(orga));
            });
          },
        ),
      ],
    );
  }
}

Future _showSiteCreationDialog(BuildContext context, Function(Site s) onValidation) {
  final nameController = TextEditingController();

  var nameError = false;

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void submit() {
            if (nameController.text.isEmpty) {
              setState(() {
                nameError = nameController.text.isEmpty;
              });
            } else {
              Navigator.pop(context);
              onValidation(Site(name: nameController.text));
            }
          }

          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            actionsPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            title: Text(Translation.current.createSiteTitle),
            content: DialogColumn(
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: Translation.current.name,
                    errorText: nameError ? Translation.current.nameError : null,
                  ),
                  controller: nameController,
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
