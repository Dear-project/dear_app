import 'dart:ui';

import 'package:dear_app/Feature/Main/Shared/component/professor_cell.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfessorListView extends StatelessWidget {
  const ProfessorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("관련 검색어를 검색해 보세요"),
              Text("필터"),
            ],
          ),
          Center(
            child: SizedBox(
              height: 550,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < 10; i++)
                      Padding(
                        padding: EdgeInsets.only(bottom: 14),
                        child: ProfessorCell(),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
