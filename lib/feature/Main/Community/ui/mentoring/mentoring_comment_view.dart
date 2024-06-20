import 'package:dear_app/Feature/main/community/component/Community/in_community_comment.dart';
import 'package:dear_app/shared/theme/dear_color.dart';
import 'package:flutter/material.dart';

class MentoringCommentView extends StatelessWidget {
  const MentoringCommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DearColors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: DearColors.white,
          title: Text(
            "댓글",
            style: TextStyle(
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          toolbarHeight: 45,
        ),
        body: SizedBox(
          height: 900,
          child: SingleChildScrollView(
            child: Column(
              children: [
                InCommunityComment(),
                InCommunityComment(commentType: CommunityCommentType.reply),
                for (int i = 0; i < 20; i++) InCommunityComment(),
              ],
            ),
          ),
        ));
  }
}
