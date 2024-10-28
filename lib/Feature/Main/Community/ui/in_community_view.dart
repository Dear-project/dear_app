import 'package:dear_app/Feature/Auth/Signup/component/dear_textfield_button.dart';
import 'package:dear_app/Feature/Main/Community/component/community/in_community_comment.dart';
import 'package:dear_app/Feature/Main/Community/view_model/controller/community_view_model.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InCommunityView extends StatefulWidget {
  final int id;

  const InCommunityView({super.key, required this.id});

  @override
  State<InCommunityView> createState() => _InCommunityViewState();
}

class _InCommunityViewState extends State<InCommunityView> {
  final _communityVM = Get.put(CommunityViewModel());

  @override
  void initState() {
    super.initState();
    _communityVM.getPostbyId(widget.id);
    _communityVM.getComments(widget.id);
  }

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
                    image: DearIcons.arrowLeft.toIcon().image,
                    width: 36,
                    height: 36,
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();

                  }),
            ],
          ),
        ),
        leadingWidth: 64,
      ),
      body: Obx(() =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
                              child: DearIcons.communityProfile.toIcon(),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _communityVM.infoById.value?.userName ?? "",
                                    style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    _communityVM.infoById.value?.getDate() ??
                                        "",
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
                              child: DearIcons.detailVertical.toIcon(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 22),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27),
                        child: Text(
                          _communityVM.infoById.value?.title ?? "제목",
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
                          _communityVM.infoById.value?.content ?? "내용",
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 8,
                        ),
                      ),
                      ...List.generate(
                          _communityVM.commentList.value!.length, (index) {
                        return Column(
                            children: [
                              SizedBox(height: 10),
                              InCommunityComment(response: _communityVM.commentList.value![index])
                            ]);
                      }
                      )
                    ],
                  ),
                ),
              ),
              ColoredBox(
                color: Color(0xffF1F1F1),
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 1,
                ),
              )
            ],
          )),
      bottomSheet: BottomAppBar(
          color: DearColors.white,
          surfaceTintColor: DearColors.white,
          height: 105,
          child: Column(
            children: [
              Container(
                height: 1,
                decoration: BoxDecoration(color: Color(0xffF1F1F1)),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CupertinoTextField(
                      controller: _communityVM.commentController,
                      decoration: BoxDecoration(),
                      placeholder: "댓글을 입력해 주세요.",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 15,
                      )),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: DearTextFieldButton(
                          action: () {
                            _communityVM.postComment(
                                widget.id);
                          },
                          buttonText: "댓글 달기"))
                ],
              ),
            ],
          )),
    );
  }
}
