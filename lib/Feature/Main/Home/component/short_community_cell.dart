import 'package:dear_app/Feature/Main/Community/model/community_response.dart';
import 'package:dear_app/Feature/Main/Community/ui/in_community_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShortCommunityCell extends StatelessWidget {
  CommunityResponse model;

  ShortCommunityCell({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 10),
              Text(
                model.content,
                style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xffAAAAAA)),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          onPressed: () {
            Get.to(() => InCommunityView(id: model.id));
          }),
    );
  }
}
