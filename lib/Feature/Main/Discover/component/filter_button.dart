import 'package:flutter/widgets.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 33,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: Border.all(color: Color(0xffF1F1F1), width: 1.0),
          shape: BoxShape.rectangle),
      child: Text(
        "필터",
        style: TextStyle(
          fontFamily: "Pretendard",
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Color(0xffAAAAAA),
        ),
      ),
    );
  }
}
