import 'package:dear_app/Feature/Auth/Onboarding/ui/onboarding_view.dart';
import 'package:dear_app/Shared/model/dearTabViewItem.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DearTabView extends StatefulWidget {
  final List<DearTabViewItem> items;
  final ValueChanged<int>? onClick;
  const DearTabView({required this.items, this.onClick});

  @override
  State<StatefulWidget> createState() => _DearTabViewState();
}

class _DearTabViewState extends State<DearTabView> {
  void clickItem(int index) {
    setState(() {
      if (!widget.items[index].toggle == true) {
        widget.items.forEach((element) {
          element.toggle = false;
        });
        widget.items[index].toggle = true;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffF1F1F1),
            width: 1.0
          ),
          right: BorderSide(
              color: Color(0xffF1F1F1),
              width: 1.0
          ),
          left: BorderSide(
              color: Color(0xffF1F1F1),
              width: 1.0
          ),
        ),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < widget.items.length; i++)
                  CupertinoButton(
                      child: Image(
                        image: widget.items[i].icon.toFill(widget.items[i].toggle).image,
                        width: 22,
                        height: 22,
                        fit: BoxFit.fitWidth,
                      ),
                      onPressed: () {
                        clickItem(i);
                        widget.onClick?.call(i);
                      })
              ]
          )
      )
    );
  }
}
