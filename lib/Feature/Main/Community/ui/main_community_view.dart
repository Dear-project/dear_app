import 'package:dear_app/Feature/Main/Community/ui/my_post_view.dart';
import 'package:dear_app/Feature/Main/Profile/view_model/controller/profile_view_model.dart';
import 'package:dear_app/Feature/Main/community/component/my_writing_cell.dart';
import 'package:dear_app/Feature/Main/Community/ui/community_view.dart';
import 'package:dear_app/Feature/Main/Community/ui/Shared/writing_view.dart';
import 'package:dear_app/Shared/component/dear_logo.dart';
import 'package:dear_app/Shared/component/dear_top_tab_bar.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainCommunityView extends StatefulWidget {
  const MainCommunityView({super.key});

  @override
  State<MainCommunityView> createState() => _MainCommunityViewState();
}

class _MainCommunityViewState extends State<MainCommunityView>
    with SingleTickerProviderStateMixin {
  var _index = 0;

  final _profileVM = Get.put(ProfileViewModel());

  final List<Widget> _pages = [
    CommunityView(),
    MyPostView()
  ];

  late final TabController _tabController = TabController(
    length: _pages.length,
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
        backgroundColor: Color(0xffF8F9F9),
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
        body: Obx(() => Stack(
          children: [
            Column(
              children: [
                MyWritingCell(
                    name: _profileVM.model.value?.name ?? ""
                ),
                SizedBox(height: 12),
                ColoredBox(
                    color: DearColors.white,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                        child: DearTopTabBar(
                            tabController: _tabController,
                            topBarType: TopBarType.Community)
                    )
                ),
                _pages[_index],
                SizedBox(height: 100)
              ],
            ),
            Positioned(
              bottom: 100,
              right: 20,
              child: CupertinoButton(
                  onPressed: () {
                    Get.to(() => WritingView());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: DearColors.main,
                        shape: BoxShape.circle
                    ),
                    width: 45,
                    height: 45,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: DearIcons.write,
                    ),
                  )),
            )

          ],
        ))
    );
  }
}