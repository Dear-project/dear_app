import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class DearTabViewItem {
  DearTabViewItem({required this.icon, this.toggle = false});

  DearIcons icon;

  bool toggle;
}
