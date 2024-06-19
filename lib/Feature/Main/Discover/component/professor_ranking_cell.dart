import 'package:dear_app/shared/theme/dear_icons.dart';
import 'package:flutter/widgets.dart';

enum ProfessorRanking { first, second, third }

class ProfessorRankingCell extends StatelessWidget {
  ProfessorRanking RankingText;

  ProfessorRankingCell({required this.RankingText, super.key});

  String getRankingText() {
    switch (RankingText) {
      case ProfessorRanking.first:
        return "1st";
      case ProfessorRanking.second:
        return "2nd";
      case ProfessorRanking.third:
        return "3rd";
    }
  }

  Color getRankingTextColor() {
    switch (RankingText) {
      case ProfessorRanking.first:
        return Color(0xffFECE23);
      case ProfessorRanking.second:
        return Color(0xffAAAAAA);
      case ProfessorRanking.third:
        return Color(0xff6F4449);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: DearIcons.my.image,
          fit: BoxFit.fill,
          width: 70,
          height: 70,
        ),
        SizedBox(height: 3),
        Text(
          "이해준",
          style: TextStyle(
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w700,
              fontSize: 12),
        ),
        SizedBox(height: 3),
        SizedBox(
          width: 60,
          child: Text(
            "영남이공대학\n박승철 헤어과",
            style: TextStyle(
              fontFamily: "Pretendard",
              fontSize: 10,
              color: Color(0xff787878),
            ),
          ),
        ),
        SizedBox(height: 7),
        Text(
          "${getRankingText()}",
          style: TextStyle(
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: getRankingTextColor(),
          ),
        ),
      ],
    );
  }
}
