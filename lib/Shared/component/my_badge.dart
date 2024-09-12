import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  // Variables
  final Widget? icon;
  final String? text;
  final TextStyle? textStyle;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  const MyBadge({Key? key, this.icon, this.text, this.bgColor, this.textStyle, this.padding}) : super(key: key);

  // @overrideMyBadge
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: bgColor ?? Colors.red,
            borderRadius: BorderRadius.circular(15)),
        padding: padding ?? const EdgeInsets.all(0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(width: 0, height: 0),
            icon != null ? const SizedBox(width: 5) : const SizedBox(width: 0, height: 0),
            Center(child: Text(text ?? "", style: textStyle ?? const TextStyle(color: Colors.white))),
          ],
        ));
  }
}
