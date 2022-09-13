import 'package:flutter/material.dart';

class DateTimeFormat {
  static String displayTimeComputation({@required int milliseconds}) {
    var duration = Duration(milliseconds: milliseconds);

    if (duration.inDays > 0) {
      return '${(milliseconds / 8.64e+7).toStringAsFixed(0)} Days';
    } else if (duration.inHours > 0) {
      return '${(milliseconds / 3.6e+6).toStringAsFixed(0)} h';
    } else if (duration.inMinutes > 0) {
      return '${(milliseconds / 60000).toStringAsFixed(0)} m';
    } else if (duration.inSeconds > 0) {
      return '${(milliseconds / 1000).toStringAsFixed(0)} s';
    } else {
      return '0 s';
    }
  }
}
