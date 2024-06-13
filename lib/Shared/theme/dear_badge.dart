import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/cupertino.dart';

enum BadgeSize {
  small,
  medium,
  large
}

class DearBadge extends StatelessWidget {
  final BadgeSize? size;

  const DearBadge({this.size = BadgeSize.small});

  double getSize() {
    return switch (size) {
      BadgeSize.small => 6,
      BadgeSize.medium => 8,
      BadgeSize.large => 12,
      null => 6
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(),
      height: getSize(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: DearColors.red.red300
      ),
    );
  }

}