import 'package:carbon/common/carbon_pie_chart.dart';
import 'package:carbon/common/extensions.dart';
import 'package:carbon/gen/colors.gen.dart';
import 'package:carbon/translations/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MiniScopesPieChart extends StatelessWidget {
  const MiniScopesPieChart({
    Key? key,
    required this.scope1Footprint,
    required this.scope2Footprint,
    required this.scope3Footprint,
  }) : super(key: key);

  final double scope1Footprint;
  final double scope2Footprint;
  final double scope3Footprint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 76,
          height: 76,
          child: CarbonPieChart(
            fontColor: Colors.white,
            backgroundColor: ColorName.lightGreen,
            segments: [
              CarbonPieChartSegment(color: ColorName.scope1DarkColor, value: scope1Footprint),
              CarbonPieChartSegment(color: ColorName.scope2DarkColor, value: scope2Footprint),
              CarbonPieChartSegment(color: ColorName.scope3DarkColor, value: scope3Footprint),
            ],
          ),
        ),
        Text(Translation.current.unitTonsCO2e, style: context.textTheme.bodyText1?.copyWith(color: Colors.white)),
      ],
    );
  }
}

class ScopesPieChart extends StatelessWidget {
  const ScopesPieChart({
    Key? key,
    required this.scope1Footprint,
    required this.scope2Footprint,
    required this.scope3Footprint,
  }) : super(key: key);

  final double scope1Footprint;
  final double scope2Footprint;
  final double scope3Footprint;

  @override
  Widget build(BuildContext context) {
    const parisNYreturnTCO2e = 0.5044 * 2; // given by https://eco-calculateur.dta.aviation-civile.gouv.fr/

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: CarbonPieChart(
                  fontColor: Colors.black87,
                  backgroundColor: Colors.white,
                  segments: [
                    CarbonPieChartSegment(color: ColorName.scope1Color, value: scope1Footprint),
                    CarbonPieChartSegment(color: ColorName.scope2Color, value: scope2Footprint),
                    CarbonPieChartSegment(color: ColorName.scope3Color, value: scope3Footprint),
                  ],
                ),
              ),
              const Gap(8),
              SizedBox(
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PieIndicator(
                      color: ColorName.scope1Color,
                      text: Translation.current.scopeFootprint('1', scope1Footprint.toShortString(context, 1)),
                    ),
                    _PieIndicator(
                      color: ColorName.scope2Color,
                      text: Translation.current.scopeFootprint('2', scope2Footprint.toShortString(context, 1)),
                    ),
                    _PieIndicator(
                      color: ColorName.scope3Color,
                      text: Translation.current.scopeFootprint('3', scope3Footprint.toShortString(context, 1)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.airplanemode_active),
              const Gap(8),
              Text(
                Translation.current.flightEquivalent(
                  ((scope1Footprint + scope2Footprint + scope3Footprint) / parisNYreturnTCO2e).toShortString(context, 1),
                ),
                style: context.textTheme.bodyText1?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PieIndicator extends StatelessWidget {
  const _PieIndicator({
    Key? key,
    required this.color,
    required this.text,
    // ignore: unused_element
    this.size = 16,
    // ignore: unused_element
    this.textColor = Colors.black87,
  }) : super(key: key);

  final Color color;
  final String text;
  final double size;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 42),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Row(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
            const Gap(4),
            Expanded(
              child: Text(
                text,
                style: context.textTheme.bodyText2?.copyWith(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
