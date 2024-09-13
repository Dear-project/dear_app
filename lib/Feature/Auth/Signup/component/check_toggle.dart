import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckToggle extends StatelessWidget {
  final bool toggle;
  final Function? onPressed;

  CheckToggle({required this.toggle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF1F2F3),
                border: Border.all(color: Color(0xffC5D0DA))),
            child: Center(
                child: Image(
                  image: DearIcons.check.image,
                  width: 13,
                  height: 10,
                  color: toggle ? Color(0xff0E2764) : Colors.transparent,
                ))));
  }
}