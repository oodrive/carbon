import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension MapExtension<K, V> on Map<K, V> {
  Iterable<T> mapIndexed<T>(T Function(int idx, K key, V value) f) => keys
      .toList()
      .asMap()
      .map(
        (idx, key) => MapEntry(
          idx,
          f(idx, key, values.elementAt(idx)),
        ),
      )
      .values;
}

extension DoubleExtension on double {
  String toShortString(BuildContext context, int maxFractionDigits) {
    final formatter = NumberFormat.decimalPattern(Localizations.localeOf(context).languageCode)
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = maxFractionDigits;
    return formatter.format(this);
  }

  String toLocalizedString(BuildContext context) {
    final formatter = NumberFormat.decimalPattern(Localizations.localeOf(context).languageCode);
    return formatter.format(this);
  }
}

extension StringExtension on String {
  double? decimalToDouble(BuildContext context) {
    final formatter = NumberFormat.decimalPattern(Localizations.localeOf(context).languageCode);

    try {
      return formatter.parse(this).toDouble();
    } catch (_) {
      try {
        return formatter.parse(replaceAll('.', ',')).toDouble();
      } catch (_) {
        try {
          return formatter.parse(replaceAll(',', '.')).toDouble();
        } catch (_) {
          return null;
        }
      }
    }
  }
}
