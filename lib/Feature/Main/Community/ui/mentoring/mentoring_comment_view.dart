import 'package:dear_app/Feature/Main/Community/component/Community/in_community_comment.dart';
import 'package:flutter/material.dart';

class MentoringCommentView extends StatelessWidget {
  const MentoringCommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InCommunityComment(),
        InCommunityComment(),
        InCommunityComment(),
        InCommunityComment(),
        InCommunityComment(),
        InCommunityComment(),
        InCommunityComment(),
        InCommunityComment(),
        InCommunityComment(),
      ],
    );
  }
}
