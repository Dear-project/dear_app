import 'package:flutter/widgets.dart';

class BlockedPersonView extends StatelessWidget {
  const BlockedPersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("차단한 사람이 없습니다.")
    );
  }
}