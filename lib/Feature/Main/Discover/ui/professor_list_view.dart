import 'package:flutter/widgets.dart';

class ProfessorListView extends StatelessWidget {
  const ProfessorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("교수님 목록"),
        ],
      ),
    );
  }
}
