import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

enum CommunityCommentType { comment, reply }

class InCommunityComment extends StatelessWidget {
  InCommunityComment(
      {this.commentType = CommunityCommentType.comment, super.key});

  CommunityCommentType commentType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(27, 23, 27, 0),
      child: Row(
        children: [
          if (commentType == CommunityCommentType.reply) SizedBox(width: 47),
          Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: DearIcons.communityProfile),
          SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "김가영",
                style: TextStyle(
                  height: 1.2,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "제가 알려드리겠습니다~ 시급 10만원!",
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
                  Text(
                    "2024.06.08. 오전 11:25",
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Color(0xff787878),
                    ),
                  ),
                  SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      print("답글달기 button clicked!");
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: Color(0xff787878),
                    ),
                    child: Text(
                      "답글달기",
                      style: TextStyle(
                        height: 1.2,
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
          Spacer(flex: 1),
          SizedBox(
            width: 20,
            height: 40,
            child: DearIcons.detail,
          ),
        ],
      ),
    );
  }
}
