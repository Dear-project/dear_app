import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DearToggleButton extends StatefulWidget {
  DearToggleButton({super.key});

  // final isSelected = <bool>[false, false];

  var isEnabled = false;

  @override
  State<DearToggleButton> createState() => _DearToggleButtonState();
}

class _DearToggleButtonState extends State<DearToggleButton> {

  final animationDuration = Duration(milliseconds: 135);

  // @override
  // Widget build(BuildContext context) {
  //   return ToggleButtons(
  //     children: [
  //       SizedBox(width: 20),
  //       SizedBox(width: 20),
  //     ],
  //     onPressed: (index) {
  //       widget.isSelected[index] = !widget.isSelected[index];
  //     },
  //     isSelected: widget.isSelected,
  //     selectedColor: Colors.red,
  //     selectedBorderColor: Color(0xFF6200EE),
  //     fillColor: Color(0xFF6200EE).withOpacity(0.08),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isEnabled = !widget.isEnabled;
        });
      },
      child: AnimatedContainer(
        width: 51,
        height: 34,
        duration: animationDuration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.isEnabled ? Color(0xff0E2764) : Color(0xff787880).withOpacity(0.16),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              // spreadRadius: 2,
              // blurRadius: 10,
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: animationDuration,
          alignment: widget.isEnabled ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
