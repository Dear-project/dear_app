import 'package:dear_app/feature/main/profile/component/dear_toggle_button.dart';
import 'package:dear_app/feature/main/profile/component/profile_button.dart';
import 'package:dear_app/shared/component/dear_logo.dart';
import 'package:dear_app/shared/theme/dear_color.dart';
import 'package:dear_app/shared/theme/dear_icons.dart';
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

  @override
  void initState() {
    super.initState();

    _profileVM.getProfile();
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColoredBox(
              color: Color(0xffFFFFFF),
              child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 210,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 116,
                          height: 116,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff0E2764), width: 5),
                              shape: BoxShape.circle),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image(
                                  image: _profileVM.model.value?.imgPath != null
                                      ? NetworkImage(
                                      _profileVM.model.value!.imgPath!)
                                      : DearIcons.my.image,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffD1D1D1),
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 4
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: DearIcons.write,
                                    )
                                )
                              )



                            ],
                          )),
                      Text(
                        _profileVM.model.value?.name ?? "",
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
            ),
            ColoredBox(
              color: DearColors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34),
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 61,
                  child: Row(
                    children: [
                      Text(
                        "알림 설정",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(flex: 1),
                      DearToggleButton(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ProfileButton(buttonType: ProfileButtonType.SeeMyReview),
            ProfileButton(buttonType: ProfileButtonType.ServicePolicy),
            ProfileButton(buttonType: ProfileButtonType.Inquiry),
            Divider(
              height: 1,
              color: Color(0xffE6E6E6),
            ),
            ProfileButton(buttonType: ProfileButtonType.Logout),
            ProfileButton(buttonType: ProfileButtonType.MemberSecession),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
