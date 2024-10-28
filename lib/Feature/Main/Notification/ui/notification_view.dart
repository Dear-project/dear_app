import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        scrolledUnderElevation: 0.0,
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
                    width: 24,
                    height: 24,
                    fit: BoxFit.fitWidth,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();

                  }),
              Text(
                "알림",
                style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        leadingWidth: 132,
        backgroundColor: DearColors.white,
      ),
    );
  }

}