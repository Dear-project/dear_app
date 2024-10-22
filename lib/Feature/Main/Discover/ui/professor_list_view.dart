import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/Main/Discover/ui/professor_profile_view.dart';
import 'package:dear_app/Feature/Main/Profile/view_model/controller/profile_view_model.dart';
import 'package:dear_app/Feature/Main/Shared/component/professor_cell.dart';
import 'package:dear_app/Shared/controller/user_role_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProfessorListView extends StatefulWidget {
  const ProfessorListView({super.key});

  @override
  State<ProfessorListView> createState() => _ProfessorListViewState();
}

class _ProfessorListViewState extends State<ProfessorListView> {
  final _discoverVM = Get.put(DiscoverViewModel());
  final _roleController = UserRoleController.shared;
  final _profileVM = Get.put(ProfileViewModel());

  @override
  void initState() {
    super.initState();
    _discoverVM.pagingController.addPageRequestListener((pageKey) {
      _discoverVM.getProfessor(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Flexible(
          child: PagedListView<int, DiscoverResponse>(
              shrinkWrap: false,
              pagingController: _discoverVM.pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (BuildContext context, item, index) {
                  if(_profileVM.model.value?.id != item.userId) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 7),
                      child: ProfessorCell(
                        professorInfo: item,
                        action: () {
                          Get.to(() => ProfessorProfileView(
                                professorInfo: item,
                              ));
                        },
                      ));
                  } else {
                    return Container();
                  }
                },
              ))),
      SizedBox(height: 100)
    ]);
  }
}
