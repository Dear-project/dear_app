import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchoolSearchBar extends StatelessWidget {
  SchoolSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffC5D0DA)
          ),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 270,
                child: CupertinoTextField(
                  cursorColor: Colors.black.withOpacity(0.3),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    decoration: BoxDecoration()
                )
            ),

            Container(
              child: CupertinoButton(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Icon(CupertinoIcons.search, color: Color(0xff787878),),
                  onPressed: () {

                  })
            )
          ],
        )
    );
  }

}