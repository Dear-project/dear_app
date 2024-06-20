import 'package:dear_app/Feature/main/community/component/Mentoring/mentoring_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MentoringView extends StatelessWidget {
  const MentoringView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < 10; i++) MentoringCell(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
