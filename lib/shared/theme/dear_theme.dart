import 'package:dear_app/shared/theme/dear_color.dart';
import 'package:flutter/material.dart';

final ThemeData DearTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: DearColors.main,
        selectionColor: DearColors.main.withOpacity(0.2),
        selectionHandleColor: DearColors.main));
