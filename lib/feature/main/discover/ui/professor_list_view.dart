import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/main/discover/component/filter_button.dart';
import 'package:dear_app/Feature/main/discover/component/search_word_bar.dart';
import 'package:dear_app/Feature/main/discover/ui/professor_profile_view.dart';
import 'package:dear_app/Feature/main/Shared/component/professor_cell.dart';
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
    _discoverVM.getProfessor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(27, 15, 27, 0),
                child: Row(
                  children: [
                    SearchWordBar(),
                    SizedBox(width: 4),
                    FilterButton(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: SizedBox(
                  height: 525,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding( // 이 패딩 위젯 지워야함(더미)
                          padding: EdgeInsets.only(bottom: 14),
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfessorProfileView(professorInfo: null,)));
                            },
                            child: ProfessorCell(professorInfo:  null,),
                          ),
                        ),
                        ...List.generate(
                          _discoverVM.model.value!.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(bottom: 14),
                            child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfessorProfileView(professorInfo: _discoverVM.model.value != null ? _discoverVM.model.value!.elementAt(index) : null,)));
                              },
                              child: ProfessorCell(professorInfo: _discoverVM.model.value != null ? _discoverVM.model.value!.elementAt(index) : null,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
