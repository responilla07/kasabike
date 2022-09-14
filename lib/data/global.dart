import 'package:flutter/material.dart';
import 'dart:math' show cos, sqrt, asin;

import 'dart:math';

const double pi = 3.1415926535897932;

class Maths {
  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;

    // var p = pi;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 3960 * asin(sqrt(a));
  }
}

navigatorPush({
  @required BuildContext context,
  @required String name,
  @required Widget widget,
  Function(dynamic) callback,
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar(
    reason: SnackBarClosedReason.dismiss,
  );
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: name ?? ""),
    ),
  ).then((value) {
    if (value != null) callback(value);
  });
}

void showScaffoldMessage({
  String message =
      "Oops! Something went wrong. \n\nYou’re getting this message due to an unknown issue. Try restarting the app. If this issue persists, please contact customersupport@limitlesslifestyle.ph.",
  BuildContext context,
  Color color = Colors.red,
}) {
  var messenger = ScaffoldMessenger.of(context);

  messenger.removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
  messenger.showSnackBar(SnackBar(
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    content: Text(
      message,
      // style: TextStyle(fontFamily: LimitlessTextStyle.mainFont),
    ),
  ));
}
