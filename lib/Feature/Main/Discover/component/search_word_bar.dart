import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWordBar extends StatefulWidget {
  SearchWordBar({super.key});

  @override
  State<SearchWordBar> createState() => _SearchWordBarState();
}

class _SearchWordBarState extends State<SearchWordBar> {
  TextEditingController SearchWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      width: 167,
      child: TextFormField(
        controller: SearchWordController,
        decoration: InputDecoration(
          hintText: "관련 단어를 검색해 보세요",
          hintStyle: TextStyle(
            fontFamily: "Pretendard",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xffAAAAAA),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Color(0xffF1F1F1), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Color(0xffD1D1D1), width: 1.0),
          ),
        ),
      ),
    );
  }
}
