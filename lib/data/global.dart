
import 'package:flutter/material.dart';

navigatorPush({
  @required BuildContext context,
  @required String name,
  @required Widget widget,
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
  );
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
