import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:flutter/cupertino.dart';

class DearBadge extends StatelessWidget {
  DearBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: DearColors.red.red300
      ),
    );
  }

}