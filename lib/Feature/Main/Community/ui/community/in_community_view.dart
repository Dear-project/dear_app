import 'package:dear_app/Feature/Auth/Signup/component/dearTextFieldButton.dart';
import 'package:dear_app/Feature/Main/Community/component/community/in_community_comment.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InCommunityView extends StatefulWidget {
  const InCommunityView({super.key});

  @override
  State<InCommunityView> createState() => _InCommunityViewState();
}

class _InCommunityViewState extends State<InCommunityView> {
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DearColors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Image(
                    image: DearIcons.back.image,
                    // 이 아이콘 피그마랑 다름. 추가해야함.
                    width: 36,
                    height: 36,
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
        leadingWidth: 64,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 735,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: DearIcons.communityProfile,
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "박유현",
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "2024.06.08. 오후 12:12",
                                style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff787878),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 1),
                        SizedBox(
                          width: 20,
                          height: 40,
                          child: DearIcons.detailVertical,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Text(
                      "스프링부트 알려주실 분 찾습니다ㅜㅜ",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Text(
                      "지금 서버공부하고 싶은데 어떻게 시작하는지 모르겠어요ㅜㅜ 스프링부트좀 알려주세요",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  ColoredBox(
                    color: Color(0xffF4F5F9),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 8,
                    ),
                  ),
                  InCommunityComment(),
                  InCommunityComment(commentType: CommunityCommentType.reply),
                  for (int i = 0; i < 10; i++) InCommunityComment(),
                ],
              ),
            ),
          ),
          ColoredBox(
            color: Color(0xffF1F1F1),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        color: DearColors.white,
        surfaceTintColor: DearColors.white,
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Stack(
              children: [
                TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    hintText: "댓글을 입력해 주세요.",
                    hintStyle: TextStyle(
                      fontFamily: "Pretendard",
                      fontSize: 15,
                      color: Color(0xffAAAAAA),
                    ),
                    border: InputBorder.none,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(260, 0, 0, 0),
                  child: Transform.scale(
                    scale: 0.9,
                    child: DearTextFieldButton(
                        action: () {
                          print("댓글 달기 button clicked!");
                        },
                        buttonText: "댓글 달기"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
