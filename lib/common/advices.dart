import 'package:carbon/common/widgets.dart';
import 'package:carbon/gen/colors.gen.dart';
import 'package:carbon/model/criteria.dart';
import 'package:carbon/model/organization.dart';
import 'package:carbon/translations/gen/l10n.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'extensions.dart';

class _CriteriaInfo {
  const _CriteriaInfo(this.tCO2e, this.criteria, this.scopeIdx);

  final double tCO2e;
  final Criteria criteria;
  final int scopeIdx;
}

class Advices extends StatelessWidget {
  const Advices({
    Key? key,
    required this.sites,
  }) : super(key: key);

  final List<Site> sites;

  @override
  Widget build(BuildContext context) {
    double totalTCO2e = 0;
    final orderedCriteria = List<_CriteriaInfo>.empty(growable: true);

    for (final site in sites) {
      for (int scopeIdx = 0; scopeIdx < 3; scopeIdx++) {
        for (final criteriaInfo in site.getScopes()[scopeIdx].getCriteriaMap().entries) {
          final tCO2e = criteriaInfo.value.fold<double>(0, (tCO2e, e) => tCO2e += criteriaInfo.key.tCO2e(e));
          totalTCO2e += tCO2e;

          // We only take significant criteria
          if (tCO2e > 1) {
            final previousCriteriaIdx =
                orderedCriteria.indexWhere((c) => identical(c.criteria, criteriaInfo.key) && c.scopeIdx == scopeIdx);
            if (previousCriteriaIdx != -1) {
              final previousCriteria = orderedCriteria.removeAt(previousCriteriaIdx);
              orderedCriteria.add(_CriteriaInfo(tCO2e + previousCriteria.tCO2e, criteriaInfo.key, scopeIdx));
            } else {
              orderedCriteria.add(_CriteriaInfo(tCO2e, criteriaInfo.key, scopeIdx));
            }
          }
        }
      }
    }

    orderedCriteria.sort((a, b) => -a.tCO2e.compareTo(b.tCO2e));

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: orderedCriteria
          .mapIndexed(
            (idx, c) => Stack(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: ColorName.paleGreen,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Tap(
                      onTap: () {
                        _showAdvicesDialog(context, c.criteria);
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${idx + 1}. ',
                                  style: context.textTheme.headline3?.copyWith(color: ColorName.lightGreen),
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        c.criteria.getTitle(context),
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textTheme.subtitle1,
                                      ),
                                      const Gap(2),
                                      Text(
                                        '${((c.tCO2e / totalTCO2e) * 100).toInt()}% (${c.tCO2e.toShortString(context, 1)} ${Translation.current.unitTonsCO2e})',
                                        style: context.textTheme.caption?.copyWith(color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Gap(16),
                            Text(
                              Translation.current.seeAdvices,
                              style: context.textTheme.caption?.copyWith(color: ColorName.darkGreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ScopeDot(scopeIdx: c.scopeIdx),
              ],
            ),
          )
          .toList(),
    );
  }
}

Future _showAdvicesDialog(BuildContext context, Criteria c) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        actionsPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        title: Text(c.getTitle(context)),
        content: DialogColumn(
          children: [
            AutoLinkMarkdown(data: c.getAdvice(context) ?? Translation.current.noAdvices),
          ],
        ),
        actions: [
          const CancelButton(),
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
}
