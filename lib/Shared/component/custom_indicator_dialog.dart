import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIndicatorDialog {
  // Paramiteres
  final BuildContext context;
  bool isDismissible = true;

  // Local variables
  late BuildContext _dismissingContext;

  // Constructor
  CustomIndicatorDialog(this.context, {this.isDismissible = true});

  // Show progress dialog
  Future<bool> show() async {
    try {
      showDialog<dynamic>(
        context: context,
        barrierDismissible: isDismissible,
        builder: (BuildContext context) {
          _dismissingContext = context;
          return WillPopScope(
              onWillPop: () async => isDismissible, child: _dialog());
        },
      );
      // Delaying the function for 200 milliseconds
      // [Default transitionDuration of DialogRoute]
      await Future.delayed(const Duration(milliseconds: 200));
      debugPrint('show progress dialog() -> sucess');
      return true;
    } catch (err) {
      debugPrint('Exception while showing the progress dialog');
      debugPrint(err.toString());
      return false;
    }
  }

  // Build progress dialog
  Widget _dialog() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoActivityIndicator(
          radius: 15, animating: true, color: Colors.black26),
    );
  }

  // Hide progress dialog
  Future<bool> hide() async {
    try {
      Navigator.of(_dismissingContext).pop();
      debugPrint('ProgressDialog dismissed');
      return Future.value(true);
    } catch (err) {
      debugPrint('Seems there is an issue hiding dialog');
      debugPrint(err.toString());
      return Future.value(false);
    }
  }
}
