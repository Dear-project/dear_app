import 'package:dear_app/Feature/Auth/Onboarding/ui/onboardingView.dart';
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
    DearTabViewItem(icon: DearIcons.chat),
    DearTabViewItem(icon: DearIcons.inventory,),
    DearTabViewItem(icon: DearIcons.people,),
    DearTabViewItem(icon: DearIcons.my)
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
        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
        child: Row(
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
