import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/main/Shared/component/professor_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DibProfessorView extends StatefulWidget {
  const DibProfessorView({super.key});

  @override
  State<DibProfessorView> createState() => _DibProfessorViewState();
}

class _DibProfessorViewState extends State<DibProfessorView> {

  final _discoverVM = Get.put(DiscoverViewModel());

  @override
  void initState() {
    super.initState();
    _discoverVM.getBookmark();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 583,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(_discoverVM.bookmarkList.value!.length, (index) =>
                ProfessorCell(professorInfo: DiscoverResponse(0, _discoverVM.bookmarkList.value![index].name, _discoverVM.bookmarkList.value![index].content, "", "", true))
              )
            ],
          ),
        ),
      ),
    );
  }
}