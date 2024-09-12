import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSearchBar extends StatefulWidget {
  TextEditingController controller;

  ProfileSearchBar({required this.controller});

  @override
  State<StatefulWidget> createState() => _ProfileSearchBarState();
}

class _ProfileSearchBarState extends State<ProfileSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 56,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC5D0DA)),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 270,
              child: CupertinoTextField(
                controller: widget.controller,
                decoration: BoxDecoration(),
                style: TextStyle(
                    fontFamily: "Pretendard",
                    color: CupertinoColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          CupertinoButton(
            onPressed: () {},
            child: Icon(
              CupertinoIcons.search,
              color: Color(0xff0E2764),
            ),
          )
        ],
      ),
    );
  }
}
