import 'package:dear_app/Auth/School/component/schoolCell.dart';
import 'package:dear_app/Auth/School/component/schoolSearchBar.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectSchoolView extends StatelessWidget {
  const SelectSchoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 130,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          bottom: PreferredSize(
            child: Column(
              children: [
                SchoolSearchBar(),
                SizedBox(height: 10),
                Divider(
                    color: Color(0xffC5D0DA),
                ),
              ],
            ),
            preferredSize: const Size(10, 10),
          ),
          title: Text("학교 선택", style: TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 22,
                  fontWeight: FontWeight.w700
              ),
          ),
          leading: CupertinoButton(
            onPressed: () {

            },
            child: Icon(
              Icons.chevron_left,
              color: Color(0xff0E2764),
            ),

          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CupertinoButton(
                onPressed: (){},
                child: Text("초기화", style: TextStyle(
                    fontFamily: "Pretendard",
                    color: Color(0xff0E2764),
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),),
              )
            )

          ],
        ),
        body: SingleChildScrollView(
            child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: constraints.maxWidth
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...List.generate(20, (index) => SchoolCell())
                                  ]
                              )
                        )
                      );
                    }
                  )
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          child: CupertinoButton(
            onPressed: () {

            },
            child: Text(
                "다음",
                style: TextStyle(
                  color: DearColors.
                ),
            ),

          )
        )
      )
    );
  }

}