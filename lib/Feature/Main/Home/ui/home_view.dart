import 'package:dear_app/Feature/Auth/Onboarding/component/speech_bubble.dart';
import 'package:dear_app/Feature/Main/Community/view_model/controller/community_view_model.dart';
import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Feature/Main/Discover/ui/professor_profile_view.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/Main/Home/component/banner_viewer.dart';
import 'package:dear_app/Feature/Main/Home/component/meal_cell.dart';
import 'package:dear_app/Feature/Main/Home/component/schedule_cell.dart';
import 'package:dear_app/Feature/Main/Home/component/short_community_cell.dart';
import 'package:dear_app/Feature/Main/Home/component/suggestion_cell.dart';
import 'package:dear_app/Feature/Main/Home/ui/schedule_view.dart';
import 'package:dear_app/Feature/Main/Home/view_model/controller/home_view_model.dart';
import 'package:dear_app/Feature/Main/Notification/components/notification_bell.dart';
import 'package:dear_app/Feature/Main/Shared/component/professor_cell.dart';
import 'package:dear_app/Shared/controller/user_role_controller.dart';
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
  final _communityVM = Get.put(CommunityViewModel());
  final _roleController = UserRoleController.shared;

  int _activeIndex = 0;

  List<DiscoverResponse> professorSuggests = [];

  @override
  void initState() {
    super.initState();
    _homeVM.getSchedule();
    _homeVM.getBanner();
    _communityVM.getCommunityToday();
    _discoverVM.getSuggestProfessor();
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
                child:
                    Container(width: 22, height: 25, child: NotificationBell()))
          ],
        ),
        body: Obx(() => ListView(
              children: [
                if (_homeVM.model.value!.isNotEmpty)
                  BannerViewer(list: _homeVM.model.value!),
                if (_homeVM.model.value!.isNotEmpty)
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
                if (_roleController.isStudent)
                  if (_homeVM.scheduleModel.value!.isNotEmpty)
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        SizedBox(
                            height: 280,
                            child: PageView(
                              onPageChanged: (index) {
                                setState(() {
                                  _activeIndex = index;
                                });
                              },
                              children: [
                                Stack(
                                  children: [
                                    CupertinoButton(
                                        child: ScheduleCell(
                                          list: _homeVM.scheduleModel.value,
                                        ),
                                        onPressed: () {
                                          Get.to(() => ScheduleView(
                                                list:
                                                    _homeVM.scheduleModel.value,
                                              ));
                                        }),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 4),
                                          child: SpeechBubble(
                                              child: Center(
                                            child: Text(
                                              "학교의 학사일정을 확인해요!",
                                              style: TextStyle(
                                                  fontFamily: "Pretendard",
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                        )),
                                  ],
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 14),
                                    child: MealCell())
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 52, vertical: 32),
                          child: Row(
                            children: [
                              Spacer(),
                              ...List.generate(
                                  2,
                                  (index) => Row(
                                        children: [
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _activeIndex == index
                                                    ? Color(0xff0E2764)
                                                    : Color(0xffD5DCEC)),
                                          ),
                                          SizedBox(width: 12)
                                        ],
                                      ))
                            ],
                          ),
                        )
                      ],
                    ),
                if (_discoverVM.suggestProfessorList.value!.isNotEmpty)
                  _roleController.isStudent
                      ? SuggestionCell(
                          title: "이런 교수님은 어때요?",
                          leading: CupertinoButton(
                            onPressed: () {},
                            child: Image(
                              image: DearIcons.next.toIcon().image,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          content: Column(
                            children: [
                              ...List.generate(
                                2,
                                (index) => Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: ProfessorCell(
                                      professorInfo: _discoverVM
                                          .suggestProfessorList.value![index],
                                      action: () {
                                        Get.to(() => ProfessorProfileView(
                                              professorInfo: _discoverVM
                                                  .suggestProfessorList
                                                  .value![index],
                                            ));
                                      },
                                    )),
                              )
                            ],
                          ),
                        )
                      : SuggestionCell(title: "매칭요청이 왔어요"),
                if (_communityVM.todayCommunityList.value!.isNotEmpty)
                  SuggestionCell(
                    title: "오늘의 글을 확인해보세요.",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                            _communityVM.todayCommunityList.value!.length,
                            (index) => ShortCommunityCell(
                                model: _communityVM
                                    .todayCommunityList.value![index]))
                      ],
                    ),
                  ),
                SizedBox(
                  height: 100,
                )
              ],
            )));
  }
}
