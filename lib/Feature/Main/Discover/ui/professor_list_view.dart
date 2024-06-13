import 'dart:ui';

import 'package:dear_app/Feature/Main/Discover/component/filter_button.dart';
import 'package:dear_app/Feature/Main/Discover/component/search_word_bar.dart';
import 'package:dear_app/Feature/Main/Discover/ui/professor_profile_view.dart';
import 'package:dear_app/Feature/Main/Shared/component/professor_cell.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:flutter/cupertino.dart';
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
                    for (int i = 0; i < 10; i++)
                      Padding(
                        padding: EdgeInsets.only(bottom: 14),
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfessorProfileView()));
                          },
                          child: ProfessorCell(),
                        ),
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
