import 'package:dear_app/feature/main/community/component/my_writing_cell.dart';
import 'package:dear_app/feature/main/community/ui/ranking/community_ranking_view.dart';
import 'package:dear_app/feature/main/community/ui/community/community_view.dart';
import 'package:dear_app/feature/main/community/ui/mentoring/mentoring_view.dart';
import 'package:dear_app/feature/main/community/ui/shared/writing_view.dart';
import 'package:dear_app/shared/component/dear_logo.dart';
import 'package:dear_app/shared/component/dear_tab_view.dart';
import 'package:dear_app/shared/component/dear_top_tab_bar.dart';
import 'package:dear_app/shared/theme/dear_color.dart';
import 'package:dear_app/shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class MainCommunityView extends StatefulWidget {
  const MainCommunityView({super.key});

  @override
  State<MainCommunityView> createState() => _MainCommunityViewState();
}

class _MainCommunityViewState extends State<MainCommunityView>
    with SingleTickerProviderStateMixin {
  var _index = 0;

  final List<Widget> _pages = [
    CommunityView(),
    MentoringView(),
    CommunityRankingView(),
  ];

  late final TabController _tabController = TabController(
    length: 3,
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
          toolbarHeight: 40,
          elevation: 0,
          scrolledUnderElevation: 0.0,
          backgroundColor: DearColors.white,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: DearLogo(),
          ),
          leadingWidth: 140,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 16),
                MyWritingCell(),
                SizedBox(height: 18),
                DearTopTabBar(
                    tabController: _tabController,
                    topBarType: TopBarType.Community),
                SizedBox(
                  height: 14,
                ),
                _pages[_index],
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(300, 560, 0, 0),
              child: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WritingView()));
              }, icon: DearIcons.communityProfile),
            ),
          ],
        ),
        );
  }
}
