import 'package:dear_app/Shared/component/dearTabView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

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