import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:dear_app/Shared/component/dearTabView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainViewState();

}
class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: DearLogo(),
        ),
        leadingWidth: 140,
      ),
      body: Center(
        child: Text("콘텐츠")
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Divider(
              color: Color(0xffF1F1F1),
            ),

            DearTabView(),
          ],
        )
      )
    );
  }

}