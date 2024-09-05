import 'package:dear_app/Feature/Main/Discover/component/university_cell.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UniversityView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UniversityViewState();
}

class _UniversityViewState extends State<UniversityView> {
  final _discoverVM = Get.put(DiscoverViewModel());

  @override
  Widget build(BuildContext context) {
    return Expanded(child: LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.minHeight),
                child: Obx(() => IntrinsicHeight(
                      child: Column(
                        children: [
                          ...List.generate(
                            _discoverVM.univeristyList.value!.length,
                            (index) => Padding(
                                padding: EdgeInsets.only(bottom: 14),
                                child: UniversityCell(
                                   universityResponse: _discoverVM.univeristyList.value![index],
                                )),
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ))));
      },
    ));
  }
}
