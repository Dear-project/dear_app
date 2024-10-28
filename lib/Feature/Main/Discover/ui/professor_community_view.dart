import 'package:dear_app/Feature/Main/Community/component/community/community_cell.dart';
import 'package:dear_app/Feature/Main/Community/model/community_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfessorCommunityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommunityCell(model: CommunityResponse(0, 0, "이해준", "교수 커뮤니티", "안녕하세요", "", "", "", ""))
      ],
    );
  }
}