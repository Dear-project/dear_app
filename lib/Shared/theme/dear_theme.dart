import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:flutter/material.dart';

final ThemeData DearTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: DearColors.main,
        selectionColor: DearColors.main.withOpacity(0.2),
        selectionHandleColor: DearColors.main));
