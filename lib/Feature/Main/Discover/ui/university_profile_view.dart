import 'package:dear_app/Feature/Auth/School/model/school_info.dart';
import 'package:dear_app/Feature/Main/Discover/component/professor_profile_cell.dart';
import 'package:dear_app/Feature/Main/Notification/components/notification_bell.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UniversityProfileView extends StatelessWidget {
  SchoolInfo? schoolInfo;

  UniversityProfileView({this.schoolInfo});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5F9),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Image(
                image: DearIcons.arrowLeft
                    .toIcon()
                    .image,
                width: 24,
                height: 24,
                fit: BoxFit.fitWidth,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              }),
        ),
        title: Text(
          schoolInfo!.schoolName,
          style: TextStyle(
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                  width: 22,
                  height: 25,
                  child: NotificationBell()
              )
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: context.height * 0.2,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  schoolInfo!.schoolName,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            )),
                        SizedBox(width: 20),
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              scale: 0.3,
                                fit: BoxFit.fitWidth,
                                image: DearImages.schoolPlaceholder.image
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: 12),
          Container(
              height: context.height * 0.24,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: 1,
                          decoration: BoxDecoration(color: Color(0xffD1D1D1)),
                          margin: EdgeInsets.only(bottom: 5),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xff0E2764),
                                              width: 3))),
                                  padding: EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    "학교 정보",
                                    style: TextStyle(
                                      color: Color(0xff0E2764),
                                      fontFamily: "Pretendard",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )))
                      ],
                    ),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfessorProfileCell(title: "대학명", content: schoolInfo!.schoolName),
                                ProfessorProfileCell(title: "주소", content: schoolInfo!.adres),
                              ],
                            )))
                  ],
                ),
              ))
        ],
      ),
    );
  }

}