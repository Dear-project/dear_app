import 'package:dear_app/Feature/Main/Home/component/banner_viewer.dart';
import 'package:dear_app/Feature/Main/Home/component/suggestion_cell.dart';
import 'package:dear_app/Shared/component/dear_logo.dart';
import 'package:dear_app/Shared/theme/dear_badge.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF8F9F9),
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0,
          scrolledUnderElevation: 0.0,
          backgroundColor: Color(0xffF8F9F9),
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: DearLogo(),
          ),
          leadingWidth: 140,
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                    width: 22,
                    height: 25,
                    child: Stack(alignment: Alignment.topRight, children: [
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: DearIcons.bell,
                          onPressed: () {}),
                      DearBadge()
                    ])))
          ],
        ),
        body: ListView(
          children: [
            BannerViewer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34),
              child: Container(
                height: 1,
                decoration: BoxDecoration(color: Color(0xffE6E6E6)),
              ),
            ),
            SuggestionCell(
              title: "이런 교수님은 어때요?",
              leading: CupertinoButton(
                onPressed: () {},
                child: Image(
                  image: DearIcons.next.image,
                  width: 20,
                  height: 20,
                ),
              ),
              content: Column(
                children: [],
              ),
            ),
            SuggestionCell(
              title: "오늘의 글을 확인해 보세요",
            ),
          ],
        ));
  }
}
