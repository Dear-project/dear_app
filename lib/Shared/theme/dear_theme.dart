import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/material.dart';

final ThemeData DearTheme = ThemeData(
    dividerColor: Color(0xffD1D1D1),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: DearColors.main,
        selectionColor: DearColors.main.withOpacity(0.2),
        selectionHandleColor: DearColors.main));
