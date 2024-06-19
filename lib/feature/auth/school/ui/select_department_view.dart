import 'package:dear_app/feature/auth/School/component/school_search_bar.dart';
import 'package:dear_app/feature/auth/School/component/category_cell.dart';
import 'package:dear_app/feature/auth/School/component/deparment_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared/component/bottom_button.dart';

class SelectDeparmentView extends StatelessWidget {
  const SelectDeparmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size(10, 10),
            child: Column(
              children: [
                SchoolSearchBar(),
                SizedBox(height: 10),
                Divider(
                    color: Color(0xffC5D0DA),
                  ),
              ],
            ),
          ),
          title: Text(
            "학과 선택",
            style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          leading: CupertinoButton(
            onPressed: () {},
            child: Icon(
              Icons.chevron_left,
              color: Color(0xff0E2764),
            ),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CupertinoButton(
                  onPressed: () {},
                  child: Text(
                    "초기화",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        color: Color(0xff0E2764),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ))
          ],
        ),
        body: Row(
          children: [
            Container(
                color: Color(0xffF1F1F1),
                width: 115,
                child: SingleChildScrollView(
                  child: Column(
                    children: [...List.generate(50, (index) => CategoryCell())],
                  ),
                )),
            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      ...List.generate(50, (index) => DeparmentCell())
                    ],
                  ),
                ),
              )
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          height: 80,
          padding: EdgeInsets.all(0),
          color: Colors.white,
          child: CupertinoButton(onPressed: () {}, child: BottomButton(action: (){},)),
        ));
  }
}
