import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/Main/Home/component/banner_viewer.dart';
import 'package:dear_app/Feature/Main/Home/component/schedule_cell.dart';
import 'package:dear_app/Feature/Main/Home/component/student_pageview.dart';
import 'package:dear_app/Feature/Main/Home/component/suggestion_cell.dart';
import 'package:dear_app/Feature/Main/Home/ui/meal_view.dart';
import 'package:dear_app/Feature/Main/Home/ui/schedule_view.dart';
import 'package:dear_app/Feature/Main/Home/view_model/controller/home_view_model.dart';
import 'package:dear_app/Feature/Main/Shared/component/professor_cell.dart';
import 'package:dear_app/Shared/component/dear_logo.dart';
import 'package:dear_app/Shared/theme/dear_badge.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _homeVM = Get.put(HomeViewModel());
  final _discoverVM = Get.put(DiscoverViewModel());

  List<DiscoverResponse> professorSuggests = [];

  @override
  void initState() {
    super.initState();
    _homeVM.getSchedule();
    if (_discoverVM.professorList.value != null &&
        _discoverVM.professorList.value!.isNotEmpty) {
      professorSuggests = _discoverVM.professorList.value!.sublist(0, 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF8F9F9),
        appBar: AppBar(
          toolbarHeight: 40,
          elevation: 0,
          scrolledUnderElevation: 0.0,
          backgroundColor: Color(0xffF8F9F9),
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
                    child: Stack(alignment: Alignment.topRight, children: [
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: DearIcons.bell,
                          onPressed: () {}),
                      DearBadge()
                    ])))
          ],
        ),
        body: Obx(() => ListView(
              children: [
                if (_homeVM.model.value!.isNotEmpty)
                  BannerViewer(list: _homeVM.model.value!),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34),
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(color: Color(0xffE6E6E6)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: StudentPageView(
                    list: _homeVM.scheduleModel.value,
                  ),
                ),
                SuggestionCell(
                  title: "이런 교수님은 어때요?",
                  leading: CupertinoButton(
                    onPressed: () {},
                    child: Image(
                      image: DearIcons.next.image,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  content: Column(
                    children: [
                      ...List.generate(
                          professorSuggests.length,
                          (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: ProfessorCell(
                                  professorInfo: professorSuggests[index])))
                    ],
                  ),
                )
              ],
            )));
  }
}
