import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/constants.dart';
import 'package:flutter_vm_v1/app/utils/my_text_scale_factor.dart';
import 'package:intl/intl.dart';

class MyHelper {
  void keyboardShowHide(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void snackBarShow(
    BuildContext context,
    String message,
    int type,
  ) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0.0, 1.0),
              blurRadius: 3.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      backgroundColor: type == 1 ? Colors.green[800] : Colors.red[800],
      duration: Duration(milliseconds: 2000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void dialogShow(
    BuildContext context, {
    required String title,
    required Widget content,
    double contentPaddingVertical = 4.0,
    bool isDismissible = true,
    List<Widget> actions = const [],
  }) {
    Future<bool> _onWillPop() async {
      // if (!isDismissible) {
      //   return false;
      // } else {
      //   return true;
      // }

      return true;
    }

    AlertDialog alert = AlertDialog(
      title: title != "" ? Text("$title") : null,
      content: Container(
        constraints: BoxConstraints(),
        child: content,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: contentPaddingVertical,
      ),
      titlePadding: EdgeInsets.symmetric(
        horizontal: title != "" ? 16.0 : 0.0,
        vertical: title != "" ? 8.0 : 0.0,
      ),
      buttonPadding: EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 0.0,
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 4.0),
      titleTextStyle: TextStyle(
        color: kAppColor_1,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
      actions: actions,
    );

    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      barrierColor: Colors.black12.withOpacity(0.25),
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => keyboardShowHide(context),
          child: MyTextScaleFactor(
            child: WillPopScope(
              onWillPop: () => _onWillPop(),
              child: alert,
            ),
          ),
        );
      },
    );
  }

  String currencyformat(double number) {
    var _numberFormat = new NumberFormat("#,##0", "en_US");
    return _numberFormat.format(number).replaceAll(",", ".");
  }

  String removeDecimalZeroFormat(double number) {
    return number.toStringAsFixed(number.truncateToDouble() == number ? 0 : 1);
  }
}
