import 'package:dear_app/feature/main/home/component/banner_viewer.dart';
import 'package:dear_app/feature/main/home/component/suggestion_cell.dart';
import 'package:dear_app/feature/main/shared/component/professor_cell.dart';
import 'package:dear_app/shared/component/dear_logo.dart';
import 'package:dear_app/shared/component/dear_top_tab_bar.dart';
import 'package:dear_app/shared/theme/dear_badge.dart';
import 'package:dear_app/shared/theme/dear_color.dart';
import 'package:dear_app/shared/theme/dear_icons.dart';
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
                  child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: DearIcons.bell,
                            onPressed: () {

                            }),
                        DearBadge()
                      ]
                  )
              )
          )
        ],
      ),
      body: ListView(
          children: [
            BannerViewer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34),
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                    color: Color(0xffE6E6E6)
                ),
              ),
            ),
            SuggestionCell(
              title: "이런 교수님은 어때요?",
              leading: CupertinoButton(
                onPressed: () {  },
                child: Image(
                  image: DearIcons.next.image,
                  width: 20,
                  height: 20,
                ),
              ),
              content: Column(
                children: [

                ],
              ),

            ),
            SuggestionCell(
              title: "오늘은 이런글이 올라왔어요",
            ),
          ],
        )
    );
  }

}