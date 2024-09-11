import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/Main/Discover/component/filter_button.dart';
import 'package:dear_app/Feature/Main/Discover/component/search_word_bar.dart';
import 'package:dear_app/Feature/Main/Discover/ui/professor_profile_view.dart';
import 'package:dear_app/Feature/Main/Shared/component/professor_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfessorListView extends StatefulWidget {
  const ProfessorListView({super.key});

  @override
  State<ProfessorListView> createState() => _ProfessorListViewState();
}

class _ProfessorListViewState extends State<ProfessorListView> {
  final _discoverVM = Get.put(DiscoverViewModel());

  @override
  void initState() {
    super.initState();
    _discoverVM.getProfessor();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
          child: Row(
            children: [
              SearchWordBar(),
              SizedBox(width: 4),
              FilterButton(),
            ],
          ),
        ),
        Expanded(child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.minHeight),
                    child: Obx(() => IntrinsicHeight(
                          child: Column(
                            children: [
                              ...List.generate(
                                _discoverVM.professorList.value!.length,
                                (index) => Padding(
                                  padding: EdgeInsets.only(bottom: 14),
                                  child:  ProfessorCell(
                                      professorInfo: _discoverVM.professorList.value
                                          ?.elementAt(index),
                                      action: () {
                                        Get.to( () =>
                                                ProfessorProfileView(
                                              professorInfo: _discoverVM.professorList.value?.elementAt(index) ));
                                      },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                              )
                            ],
                          ),
                        ))));
          },
        )),
      ],
    );
  }
}
