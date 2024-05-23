import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:dear_app/Shared/component/dear_top_tab_bar.dart';
import 'package:dear_app/Shared/theme/dearBadge.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DearColors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.white,
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
      body: Text("홈뷰"),
    );
  }

}