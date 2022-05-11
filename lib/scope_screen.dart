import 'package:beamer/beamer.dart';
import 'package:carbon/common/extensions.dart';
import 'package:carbon/common/widgets.dart';
import 'package:carbon/gen/colors.gen.dart';
import 'package:carbon/model/criteria.dart';
import 'package:carbon/model/organization.dart';
import 'package:carbon/translations/gen/l10n.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:search_choices/search_choices.dart';

class ScopeScreen extends StatelessWidget {
  const ScopeScreen();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OrganizationsState>();

    final Organization orga;
    final Site site;
    final Scope scope;
    final int scopeIdx;
    try {
      final beamState = context.currentBeamLocation.state as BeamState;
      final organizationId = beamState.pathParameters['organizationId'];
      final siteId = beamState.pathParameters['siteId'];
      final scopeId = beamState.pathParameters['scopeId'];

      orga = state.organizations.firstWhere((o) => o.id == organizationId);
      site = orga.sites.firstWhere((s) => s.id == siteId);
      scopeIdx = scopeId?.toIntOrNull() ?? 0;
      scope = site.getScopes().elementAt(scopeIdx);
    } catch (_) {
      // handle exception by returning to home
      context.beamToNamed('/');
      return const Scaffold();
    }

    return ScreenTemplate(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [ColorName.darkGreen, ColorName.mediumGreen],
              ),
            ),
            child: const WhiteHeader(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: Text('${orga.name} (${orga.year}) - ${site.name} - ${scope.name(context)}'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48, left: 32, right: 48),
                child: Text(
                  Translation.current.scopeCriteriaTitle,
                  style: context.textTheme.headline4?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(96),
              ...scope.getCriteriaMap().mapIndexed(
                    (_, c, e) => _CriteriaItem(state: state, orga: orga, scopeIdx: scopeIdx, criteria: c, emissions: e),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CriteriaItem extends StatelessWidget {
  const _CriteriaItem({
    Key? key,
    required this.state,
    required this.orga,
    required this.scopeIdx,
    required this.criteria,
    required this.emissions,
  }) : super(key: key);

  final OrganizationsState state;
  final Organization orga;
  final int scopeIdx;
  final Criteria criteria;
  final List<Emission> emissions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                criteria.getTitle(context),
                style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap(12),
              AutoLinkMarkdown(data: criteria.getDescription(context)),
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: AutoAnimList(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            children: [
              ...emissions.mapIndexed(
                (idx, e) => _EmissionItem(
                  key: ValueKey(e),
                  onTap: () {
                    _showEmissionDialog(context, orga, e, criteria, () {
                      state.update();
                    }, () {
                      emissions.removeAt(idx);
                      state.update();
                    });
                  },
                  scopeIdx: scopeIdx,
                  emission: e,
                  criteria: criteria,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: AddButton(
                  iconColor: ColorName.mediumGreen,
                  onTap: () {
                    final emission = Emission(type: criteria.typeCo2Factors().keys.first);

                    _showEmissionDialog(
                      context,
                      orga,
                      emission,
                      criteria,
                      () {
                        emissions.add(emission);
                        state.update();
                      },
                      null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmissionItem extends StatelessWidget {
  const _EmissionItem({
    Key? key,
    required this.onTap,
    required this.scopeIdx,
    required this.emission,
    required this.criteria,
  }) : super(key: key);

  final VoidCallback onTap;
  final int scopeIdx;
  final Emission emission;
  final Criteria criteria;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: ColorName.paleGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 220,
            child: Tap(
              onTap: onTap,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        criteria.typeLabels(context)[emission.type]!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: context.textTheme.subtitle1,
                      ),
                      const Gap(8),
                      Text(
                        '${emission.quantity.toLocalizedString(context)} ${criteria.typeUnits(context)[emission.type]}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: context.textTheme.caption,
                      ),
                      const Gap(18),
                      Text(
                        '${criteria.tCO2e(emission).toShortString(context, 1)} ${Translation.current.unitTonsCO2e}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: context.textTheme.caption?.copyWith(color: ColorName.darkGreen),
                      ),
                      if (emission.note.isNotEmpty) ...[
                        const Gap(12),
                        Text(
                          emission.note,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: context.textTheme.caption,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          ScopeDot(scopeIdx: scopeIdx),
        ],
      ),
    );
  }
}

Future _showEmissionDialog(
  BuildContext context,
  Organization orga,
  Emission emission,
  Criteria criteria,
  VoidCallback onValidation,
  VoidCallback? onDelete,
) {
  final labels = criteria.typeLabels(context);

  final quantityController = TextEditingController();
  final adjustmentCoefficientController = TextEditingController();
  final noteController = TextEditingController();
  final amortizationPeriodController = TextEditingController();

  var amortizationPeriodError = false;

  if (emission.quantity > 0) quantityController.text = emission.quantity.toLocalizedString(context);
  adjustmentCoefficientController.text = emission.adjustmentCoefficient.toLocalizedString(context);
  noteController.text = emission.note;
  amortizationPeriodController.text = emission.amortizationPeriod.toString();

  var newType = emission.type;
  var quantityError = false;

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final co2Factor = criteria.typeCo2Factors()[newType]!;

          void submit() {
            final quantity = quantityController.text.decimalToDouble(context);
            final amortizationPeriod = amortizationPeriodController.text.toIntOrNull() ?? 1;

            quantityError = quantity == null || quantity == 0;
            amortizationPeriodError = amortizationPeriod < 1;

            if (quantityError || amortizationPeriodError) {
              setState(() {
                // Nothing to do, we already set the error booleans
              });
            } else {
              emission.type = newType;
              emission.quantity = quantity!;
              emission.note = noteController.text;
              emission.adjustmentCoefficient = adjustmentCoefficientController.text.decimalToDouble(context) ?? 1;
              emission.amortizationPeriod = amortizationPeriod;

              Navigator.pop(context);
              onValidation();
            }
          }

          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            actionsPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            title: Row(
              children: [
                Expanded(
                  child: Text(criteria.getTitle(context)),
                ),
                if (onDelete != null)
                  IconButton(
                    icon: Icon(Icons.delete_outline, color: Colors.red[400]),
                    tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
                    onPressed: () {
                      showValidationDialog(context, () {
                        Navigator.pop(context);
                        onDelete();
                      });
                    },
                  )
              ],
            ),
            content: DialogColumn(
              children: [
                Row(
                  children: [
                    Text(Translation.current.criteriaType),
                    const Gap(8),
                    if (criteria.typeLabels(context).length == 1)
                      Expanded(child: Text(criteria.typeLabels(context).values.first))
                    else
                      Expanded(
                        child: labels.length < 15
                            ? DropdownButton<String>(
                                isExpanded: true,
                                selectedItemBuilder: (BuildContext context) {
                                  return labels.values.map((String item) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(item),
                                      ],
                                    );
                                  }).toList();
                                },
                                value: newType,
                                underline: Container(),
                                onChanged: (String? value) {
                                  setState(() {
                                    newType = value!;
                                  });
                                },
                                items: labels
                                    .map(
                                      (key, label) => MapEntry(
                                        key,
                                        DropdownMenuItem<String>(
                                          value: key,
                                          child: Text(label),
                                        ),
                                      ),
                                    )
                                    .values
                                    .toList(),
                              )
                            : SearchChoices<String>.single(
                                items: labels
                                    .map(
                                      (key, label) => MapEntry(
                                        key,
                                        DropdownMenuItem<String>(
                                          value: label,
                                          child: Text(label),
                                        ),
                                      ),
                                    )
                                    .values
                                    .toList(),
                                displayClearIcon: false,
                                underline: Container(),
                                value: labels[newType],
                                onChanged: (String value) {
                                  setState(() {
                                    newType = labels.entries.firstWhere((e) => e.value == value).key;
                                  });
                                },
                                isExpanded: true,
                                buildDropDownDialog: (
                                  Widget titleBar,
                                  Widget searchBar,
                                  Widget list,
                                  Widget closeButton,
                                  BuildContext dropDownContext,
                                ) {
                                  return Center(
                                    child: ConstrainedBox(
                                      constraints: const BoxConstraints(maxWidth: 500),
                                      child: AnimatedContainer(
                                        padding: MediaQuery.of(dropDownContext).viewInsets,
                                        duration: 300.milliseconds,
                                        child: Card(
                                          margin: const EdgeInsets.all(64),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                titleBar,
                                                searchBar,
                                                list,
                                                closeButton,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    if (co2Factor.source.isNotEmpty) ...[
                      const Gap(8),
                      Tooltip(
                        message: Translation.current
                            .criteriaSource((co2Factor.factor * 1000).toShortString(context, 3), co2Factor.source),
                        child: const Icon(
                          Icons.help_outline,
                          color: ColorName.lightGreen,
                        ),
                      ),
                    ],
                  ],
                ),
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: Translation.current.criteriaQuantity,
                          errorText: quantityError ? Translation.current.criteriaQuantityError : null,
                        ),
                        controller: quantityController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('([0-9]+[\\s\\.,]?)*'))],
                        onSubmitted: (_) {
                          submit();
                        },
                      ),
                    ),
                    const Gap(8),
                    Text(criteria.typeUnits(context)[newType]!),
                  ],
                ),
                const Gap(16),
                TextField(
                  decoration: InputDecoration(labelText: Translation.current.criteriaAdjustmentCoefficient),
                  controller: adjustmentCoefficientController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('([0-9]+[\\s\\.,]?)*'))],
                ),
                if (criteria.hasAmortizationPeriod()) ...[
                  const Gap(16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: Translation.current.criteriaAmortizationPeriod,
                      errorText: amortizationPeriodError ? Translation.current.criteriaAmortizationPeriodError : null,
                    ),
                    controller: amortizationPeriodController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]*'))],
                  ),
                ],
                const Gap(16),
                TextField(
                  decoration: InputDecoration(labelText: Translation.current.criteriaNote),
                  controller: noteController,
                  maxLines: 4,
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
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
