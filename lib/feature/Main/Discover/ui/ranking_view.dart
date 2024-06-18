import 'package:dear_app/Feature/Main/Shared/component/professor_cell.dart';
import 'package:flutter/widgets.dart';

class RankingView extends StatelessWidget {
  const RankingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 160),
        Center(
          child: SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < 20; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: ProfessorCell(),
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
