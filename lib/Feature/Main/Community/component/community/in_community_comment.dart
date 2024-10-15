import 'package:dear_app/Feature/Main/Community/model/comment_response.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CommunityCommentType { comment, reply }

class InCommunityComment extends StatelessWidget {
  InCommunityComment(
      {this.commentType = CommunityCommentType.comment, required this.response, super.key});

  CommunityCommentType commentType;
  CommentResponse response;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(27, 23, 27, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (commentType == CommunityCommentType.reply) SizedBox(width: 47),
          Image(
            image: DearIcons.communityProfile.image,
            width: 38,
            height: 38,
          ),
          SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                response.commentor,
                style: TextStyle(
                  height: 1.2,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 6),
              Text(
                response.content,
                style: TextStyle(
                  height: 1.2,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  CupertinoButton(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                    minSize: 14,
                    onPressed: () {
                      print("답글달기 button clicked!");
                    },
                    child: Text(
                      "답글달기",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Color(0xff787878),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 20,
            height: 40,
            child: DearIcons.detailVertical,
          ),
        ],
      ),
    );
  }
}
