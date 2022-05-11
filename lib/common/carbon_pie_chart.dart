// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:carbon/common/extensions.dart';
import 'package:carbon/translations/gen/l10n.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

/// A colored piece of the [CarbonPieChart].
class CarbonPieChartSegment {
  const CarbonPieChartSegment({required this.color, required this.value});

  final Color color;
  final double value;
}

/// An animated circular pie chart to represent pieces of a whole, which can
/// have empty space.
class CarbonPieChart extends StatefulWidget {
  const CarbonPieChart({required this.fontColor, required this.backgroundColor, required this.segments});

  final Color fontColor;
  final Color backgroundColor;
  final List<CarbonPieChartSegment> segments;

  @override
  _CarbonPieChartState createState() => _CarbonPieChartState();
}

class _CarbonPieChartState extends State<CarbonPieChart> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: 600.milliseconds,
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: TweenSequence<double>(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 0),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 1),
          weight: 1.5,
        ),
      ]).animate(controller),
      curve: Curves.decelerate,
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: _AnimatedCarbonPieChart(
        animation: animation,
        fontColor: widget.fontColor,
        backgroundColor: widget.backgroundColor,
        segments: widget.segments,
      ),
    );
  }
}

class _AnimatedCarbonPieChart extends AnimatedWidget {
  const _AnimatedCarbonPieChart({
    Key? key,
    required this.animation,
    required this.fontColor,
    required this.backgroundColor,
    required this.segments,
  }) : super(key: key, listenable: animation);

  final Animation<double> animation;
  final Color fontColor;
  final Color backgroundColor;
  final List<CarbonPieChartSegment> segments;

  @override
  Widget build(BuildContext context) {
    final wholeAmount = segments.fold<double>(0, (previousValue, s) => previousValue + s.value);

    return LayoutBuilder(
      builder: (context, constraints) {
        return DecoratedBox(
          decoration: _CarbonPieChartOutlineDecoration(
            maxFraction: animation.value,
            backgroundColor: backgroundColor,
            segments: segments,
          ),
          child: Container(
            height: constraints.maxHeight,
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return constraints.maxWidth < 200
                    ? Text(
                        wholeAmount.toInt().toString(),
                        style: context.textTheme.bodyText1?.copyWith(color: fontColor),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            wholeAmount.toShortString(context, 1),
                            style: context.textTheme.headline4?.copyWith(color: fontColor),
                          ),
                          Text(
                            Translation.current.unitTonsCO2e,
                            style: context.textTheme.bodyText1?.copyWith(color: fontColor),
                          ),
                        ],
                      );
              },
            ),
          ),
        );
      },
    );
  }
}

class _CarbonPieChartOutlineDecoration extends Decoration {
  const _CarbonPieChartOutlineDecoration({required this.maxFraction, required this.backgroundColor, required this.segments});

  final double maxFraction;
  final Color backgroundColor;
  final List<CarbonPieChartSegment> segments;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CarbonPieChartOutlineBoxPainter(
      maxFraction: maxFraction,
      backgroundColor: backgroundColor,
      segments: segments,
    );
  }
}

class _CarbonPieChartOutlineBoxPainter extends BoxPainter {
  _CarbonPieChartOutlineBoxPainter({required this.maxFraction, required this.backgroundColor, required this.segments});

  final double maxFraction;
  final Color backgroundColor;
  final List<CarbonPieChartSegment> segments;
  static const double wholeRadians = 2 * math.pi;
  static const double spaceRadians = wholeRadians / 180;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // Create two padded reacts to draw arcs in: one for colored arcs and one for inner bg arc.
    const strokeWidth = 4.0;
    final outerRadius = math.min(
          configuration.size!.width,
          configuration.size!.height,
        ) /
        2;
    final outerRect = Rect.fromCircle(
      center: configuration.size!.center(offset),
      radius: outerRadius - strokeWidth * 3,
    );
    final innerRect = Rect.fromCircle(
      center: configuration.size!.center(offset),
      radius: outerRadius - strokeWidth * 4,
    );

    // Paint each arc with spacing.
    var cumulativeSpace = 0.0;
    var cumulativeTotal = 0.0;
    final wholeAmount = segments.fold<double>(0, (previousValue, s) => previousValue + s.value);
    for (final segment in segments) {
      final paint = Paint()..color = segment.color;
      final startAngle = _calculateStartAngle(cumulativeTotal, wholeAmount, cumulativeSpace);
      final sweepAngle = _calculateSweepAngle(segment.value, wholeAmount, 0);
      canvas.drawArc(outerRect, startAngle, sweepAngle, true, paint);
      cumulativeTotal += segment.value;
      cumulativeSpace += spaceRadians;
    }

    // Paint a smaller inner circle to cover the painted arcs, so they are
    // display as segments.
    final bgPaint = Paint()..color = backgroundColor;
    canvas.drawArc(innerRect, 0, 2 * math.pi, true, bgPaint);
  }

  double _calculateAngle(double amount, double wholeAmount, double offset) {
    final wholeMinusSpacesRadians = wholeRadians - (segments.length * spaceRadians);
    return maxFraction * (amount / wholeAmount * wholeMinusSpacesRadians + offset);
  }

  double _calculateStartAngle(double amount, double wholeAmount, double offset) =>
      _calculateAngle(amount, wholeAmount, offset) - math.pi / 2;

  double _calculateSweepAngle(double amount, double wholeAmount, double offset) => _calculateAngle(amount, wholeAmount, offset);
}
