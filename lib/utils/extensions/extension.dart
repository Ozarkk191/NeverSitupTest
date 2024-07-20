import 'package:intl/intl.dart';

extension NumbericX on double {
  String get toNumberFormat {
    var thres = 0.01;
    if (this % 1 < thres) {
      double number = (this ~/ 1).toDouble();
      return NumberFormat.decimalPattern().format(number);
    } else {
      return NumberFormat.decimalPattern().format(toStringAsFixed(2));
    }
  }
}

extension ListCheck on List<dynamic>? {
  bool get isEmptyOrNull {
    if (this == null) {
      return true;
    } else {
      if (this!.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  bool get isNotEmptyOrNull {
    if (this == null) {
      return false;
    } else {
      if (this!.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }
}
