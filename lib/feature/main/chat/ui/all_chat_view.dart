import 'package:dear_app/Feature/Main/Chat/component/chat_cell.dart';
import 'package:flutter/widgets.dart';

class AllChatView extends StatelessWidget {
  const AllChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
            child: Column(
      children: [for (int i = 0; i < 30; i++) ChatCell()],
    )));
  }
}
