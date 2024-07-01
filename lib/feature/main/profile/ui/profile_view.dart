import 'package:dear_app/Feature/Main/Profile/component/dear_toggle_button.dart';
import 'package:dear_app/Feature/Main/Profile/component/profile_badge.dart';
import 'package:dear_app/Feature/Main/Profile/component/profile_button.dart';
import 'package:dear_app/Feature/Main/Profile/view_model/controller/profile_view_model.dart';
import 'package:dear_app/Shared/component/dear_logo.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _profileVM = Get.put(ProfileViewModel());
  final _topController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF8F9F9),
        appBar: AppBar(
          backgroundColor: DearColors.white,
          leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30), child: DearLogo()),
          leadingWidth: 200,
          scrolledUnderElevation: 0.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            controller: _topController,
            scrollDirection: Axis.vertical,
            child: Obx(() => SizedBox(
                height: context.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        color: Color(0xffFFFFFF),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    width: 116,
                                    height: 116,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xff0E2764), width: 5),
                                        shape: BoxShape.circle),
                                    child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          _profileVM.setProfileImage();
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: _profileVM.model.value
                                                              ?.imgPath !=
                                                          null
                                                      ? NetworkImage(_profileVM
                                                          .model
                                                          .value!
                                                          .imgPath!)
                                                      : DearIcons.my.image,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(4),
                                                child: Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Container(
                                                      width: 28,
                                                      height: 28,
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xffD1D1D1),
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 4),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: DearIcons.write,
                                                    )))
                                          ],
                                        ))),
                                Text(
                                  _profileVM.model.value != null
                                      ? _profileVM.model.value!.name
                                      : "",
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontFamily: "Pretendard",
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      child: Text("내 정보 수정하기",
                                          style: TextStyle(
                                              color: Color(0xffAAAAAA),
                                              fontFamily: "Pretendard",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              decoration:
                                                  TextDecoration.underline)),
                                    )),
                                Flexible(
                                    child: SingleChildScrollView(
                                        child: Row(children: [
                                  SizedBox(width: 20),
                                  if ( _profileVM.badgeList.value!.isNotEmpty)
                                    for(var content in _profileVM.badgeList
                                        .value!)
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: ProfileBadge(),
                                      )
                                ])))
                              ],
                            ))),
                    SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        ProfileButton(
                          buttonType: ProfileButtonType.Alert,
                          onPressed: () {},
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: DearToggleButton(),
                        )
                      ],
                    ),
                    ProfileButton(
                        buttonType: ProfileButtonType.ServicePolicy,
                        onPressed: () {}),
                    ProfileButton(
                      buttonType: ProfileButtonType.Version,
                      onPressed: () {},
                    ),
                    ProfileButton(
                      buttonType: ProfileButtonType.Support,
                      onPressed: () {},
                    ),
                    SizedBox(height: 10),
                    ProfileButton(
                      buttonType: ProfileButtonType.Logout,
                      onPressed: () {
                        _profileVM.signOut();
                      },
                    ),
                    ProfileButton(
                        buttonType: ProfileButtonType.MemberSecession,
                        onPressed: () {
                          _profileVM.deleteUser();
                        }),
                    Spacer(flex: 1),
                  ],
                )))));
  }
}
