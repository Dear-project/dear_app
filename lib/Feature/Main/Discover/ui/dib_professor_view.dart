import 'package:dear_app/Feature/main/Shared/component/professor_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DibProfessorView extends StatelessWidget {
  const DibProfessorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 583,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 26),
              // for (int i = 0; i < 20; i++)
              //   Padding(
              //     padding: EdgeInsets.only(bottom: 14),
              //     child: ProfessorCell(),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}