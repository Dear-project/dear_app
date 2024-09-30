import 'package:dear_app/Feature/Main/Community/model/community_response.dart';
import 'package:dear_app/Feature/Main/Community/ui/in_community_view.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityCell extends StatelessWidget {
  CommunityResponse model;
  int id;
  CommunityCell({super.key, required this.model, required this.id});



  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: DearColors.white
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.to(() => InCommunityView(id: id));
                },
                child: SizedBox(
                  width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
                        Text(
                          model.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Pretendard",
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          model.getDate(),
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff787878),
                          ),
                        ),
                        SizedBox(height: 11),
                        Text(
                          model.content,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Pretendard",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),
            SizedBox(height: 11),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Wrap(
                children: [
                  ColoredBox(
                    color: Color(0xffD1D1D1),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 0.5,
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                        height: 14,
                        child: DearIcons.communityProfile,
                      ),
                      SizedBox(width: 7),
                      Text(
                        "${model.userName} • ${model.getTime()}",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xff787878),
                        ),
                      ),
                      Spacer(flex: 1),
                      DearIcons.communityChat,
                      SizedBox(width: 5),
                      Text(
                        "2",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xff787878),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
          ],
        )
      );
  }
}
