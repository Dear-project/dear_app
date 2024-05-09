import 'package:dear_app/Feature/Main/Chat/component/chatCell.dart';
import 'package:dear_app/Feature/Main/Profile/ui/profileView.dart';
import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:dear_app/Shared/component/dearTabView.dart';
import 'package:dear_app/Shared/model/dearTabViewItem.dart';
import 'package:dear_app/Shared/theme/dearBadge.dart';
import 'package:dear_app/Shared/theme/dearIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dear_app/Feature/Main/Chat/ui/chatView.dart';
import 'package:dear_app/Feature/Main/Home/ui/homeView.dart';
import 'package:dear_app/Feature/Main/Discover/ui/discoverView.dart';
import 'package:dear_app/Feature/Main/Community/ui/communityView.dart';
import 'package:dear_app/Feature/Main/Profile/ui/profileView.dart';


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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: DearLogo(),
        ),
        leadingWidth: 140,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 22,
              height: 25,
              child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: DearIcons.bell,
                        onPressed: () {

                    }),

                    DearBadge()
                  ]
              )
            )
          )

        ],
      ),
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