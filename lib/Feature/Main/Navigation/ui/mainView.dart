import 'package:dear_app/Feature/Main/Chat/component/chatCell.dart';
import 'package:dear_app/Feature/Main/Profile/ui/profile_view.dart';
import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:dear_app/Shared/component/dearTabView.dart';
import 'package:dear_app/Shared/model/dearTabViewItem.dart';
import 'package:dear_app/Shared/theme/dearBadge.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dear_app/Feature/Main/Chat/ui/chatView.dart';
import 'package:dear_app/Feature/Main/Home/ui/homeView.dart';
import 'package:dear_app/Feature/Main/Discover/ui/discoverView.dart';
import 'package:dear_app/Feature/Main/Community/ui/communityView.dart';
import 'package:dear_app/Feature/Main/Profile/ui/profile_view.dart';


class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainViewState();

}
class _MainViewState extends State<MainView> {
  var _index = 0;

  final List<Widget> _pages = [
    HomeView(),
    ChatView(),
    DiscoverView(),
    CommunityView(),
    ProfileView()
  ];

  final List<DearTabViewItem> _items = [
    DearTabViewItem(icon: DearIcons.home, toggle: true),
    DearTabViewItem(icon: DearIcons.chat),
    DearTabViewItem(icon: DearIcons.inventory,),
    DearTabViewItem(icon: DearIcons.people,),
    DearTabViewItem(icon: DearIcons.my)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_index],
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Divider(
              color: Color(0xffF1F1F1),

            ),

            DearTabView(
                items: _items,

                onClick: (value) {
                  setState(() {
                    _index = value;
                  });
                },
            ),
          ],
        )
      )
    );
  }

}