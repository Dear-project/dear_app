import 'package:dear_app/Feature/Main/Discover/component/professor_ranking_cell.dart';
import 'package:dear_app/Feature/Main/Shared/component/professor_cell.dart';
import 'package:flutter/widgets.dart';

class RankingView extends StatelessWidget {
  const RankingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Center(
          child: SizedBox(
            height: 677,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 47),
                        child:
                        ProfessorRankingCell(RankingText: ProfessorRanking.second),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 47),
                        child:
                        ProfessorRankingCell(RankingText: ProfessorRanking.first),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 47),
                        child:
                        ProfessorRankingCell(RankingText: ProfessorRanking.third),
                      ),
                    ],
                  ),
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
