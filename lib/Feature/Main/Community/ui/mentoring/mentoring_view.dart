import 'package:dear_app/Feature/Main/Community/component/Mentoring/mentoring_cell.dart';
import 'package:dear_app/Feature/Main/Community/ui/mentoring/mentoring_comment_view.dart';
import 'package:dear_app/Feature/Main/Community/ui/shared/writing_view.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
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
        // Padding(
        //   padding: EdgeInsets.fromLTRB(300, 400, 0, 0),
        //   child: IconButton(onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => WritingView()));
        //   }, icon: DearIcons.communityProfile),
        // ),
      ],
    );
  }
}
