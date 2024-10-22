import 'package:dear_app/Feature/Main/Home/component/meal_cell.dart';
import 'package:dear_app/Feature/Main/Home/component/schedule_cell.dart';
import 'package:dear_app/Feature/Main/Home/model/schedule_response.dart';
import 'package:dear_app/Feature/Main/Home/ui/meal_view.dart';
import 'package:dear_app/Feature/Main/Home/ui/schedule_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentPageView extends StatefulWidget {
  List<ScheduleResponse>? list;

  StudentPageView({super.key, required this.list});

  @override
  State<StudentPageView> createState() => _StudentPageViewState();
}

class _StudentPageViewState extends State<StudentPageView> {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: PageView(
          controller: controller,
          children: [
            CupertinoButton(
              child: ScheduleCell(
                list: widget.list,
              ),
              onPressed: () {
                Get.to(() => ScheduleView(
                      list: widget.list,
                    ));
              },
            ),
            CupertinoButton(
              child: MealCell(),
              onPressed: () {
                Get.to(() => MealView());
              },
            ),
          ],
        ),
    );
  }
}
