import 'package:dear_app/Shared/model/dearTabViewItem.dart';
import 'package:dear_app/Shared/theme/dearIcons.dart';
import 'package:flutter/cupertino.dart';




class DearTabView extends StatefulWidget {
  const DearTabView({super.key});

  @override
  State<StatefulWidget> createState() => _DearTabViewState();
}

class _DearTabViewState extends State<DearTabView> {
  List<DearTabViewItem> items = [
    DearTabViewItem(icon: DearIcons.home, toggle: true),
    DearTabViewItem(icon: DearIcons.chat, toggle: false),
    DearTabViewItem(icon: DearIcons.inventory, toggle: false),
    DearTabViewItem(icon: DearIcons.people, toggle: false),
    DearTabViewItem(icon: DearIcons.my, toggle: false),
  ];

  void clickItem(int index) {
    setState(() {
      if (!items[index].toggle == true) {
        items.forEach((element) {
          element.toggle = false;
        });
        items[index].toggle = true;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < items.length; i++)
                CupertinoButton(
                    child: Image(
                      image: items[i].icon.toFill(items[i].toggle).image,
                      width: 22,
                      height: 22,
                    ),
                    onPressed: () {
                      clickItem(i);
                    })
            ]));
  }
}
