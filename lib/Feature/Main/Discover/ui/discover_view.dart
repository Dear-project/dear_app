import 'package:dear_app/Feature/Main/Discover/ui/dib_professor_view.dart';
import 'package:dear_app/Feature/Main/Discover/ui/professor_list_view.dart';
import 'package:dear_app/Feature/Main/Discover/ui/university_view.dart';
import 'package:dear_app/Shared/component/dear_top_tab_bar.dart';
import 'package:dear_app/Shared/theme/dear_badge.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView>
    with SingleTickerProviderStateMixin {
  var _index = 0;

  final List<Widget> _pages = [
    ProfessorListView(),
    UniversityView(),
    DibProfessorView(),
  ];

  late final TabController _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0
  );

  @override
  void initState() {
    super.initState();

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
          toolbarHeight: 40,
          scrolledUnderElevation: 0.0,
          elevation: 0,
          title: Text(
            "학교 알아보기",
            style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: DearColors.white,
          bottom: DearTopTabBar(
            tabController: _tabController,
            topBarType: TopBarType.Discover,
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
        body: _pages[_index]
    );
  }
}