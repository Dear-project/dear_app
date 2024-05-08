import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstJoinView extends StatefulWidget {
  FirstJoinView({super.key});

  @override
  State<StatefulWidget> createState() => _FirstJoinViewState();
}

class _FirstJoinViewState extends State<FirstJoinView>
    with TickerProviderStateMixin {
  late AnimationController _offSetController;
  late Animation<Offset> _offset;



  @override
  void initState() {
    super.initState();
    _offSetController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,


    );

    _offset =
        Tween<Offset>(begin: Offset(0.37, 8.9), end: Offset(0.37, 9.7)).animate(
            _offSetController);

    _offSetController.repeat();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DearLogo(
                size: 50,
                color: Color(0xffD1D1D1),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(bottom: 80),
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "소중한 질문을",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: 340,
                      height: 56,
                      decoration: BoxDecoration(
                          color: Color(0xffEBEFFF),
                          border: Border.all(color: Color(0xffE6E6E6)),
                          borderRadius: BorderRadius.circular(13)),
                    ),
                    Text(
                      "남기다",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              )
            ],
          ),
          SlideTransition(
              position: _offset,
                child: Text(
                  "학생이 학생에게",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0E2764)
                  ),
                )
              )
        ],
      )
    ));
  }
}
