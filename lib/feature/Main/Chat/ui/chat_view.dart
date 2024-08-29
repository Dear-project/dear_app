import 'package:dear_app/Feature/Main/Chat/ui/all_chat_view.dart';
import 'package:dear_app/Feature/Main/Chat/ui/blocked_person_view.dart';
import 'package:dear_app/Shared/component/dear_top_tab_bar.dart';
import 'package:dear_app/Shared/theme/dear_badge.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with SingleTickerProviderStateMixin {
  var _index = 0;

  final List<Widget> _pages = [
    AllChatView(),
    BlockedPersonView(),
  ];

  late TabController _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
  );

  @override
  void initState() {
    _tabController.addListener(() {
      setState(() {
        _index = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DearColors.white,
      appBar: AppBar(
        backgroundColor: DearColors.white,
        toolbarHeight: 40,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        title: Text(
          "채팅",
          style: TextStyle(
              fontFamily: "Pretendard",
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        bottom: DearTopTabBar(
          tabController: _tabController,
          topBarType: TopBarType.Chat,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                  width: 22,
                  height: 25,
                  child: Stack(alignment: Alignment.topRight, children: [
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: DearIcons.bell,
                        onPressed: () {}),
                    DearBadge()
                  ])))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 22),
            _pages[_index],
          ],
        ),
      ),
    );
  }
}
