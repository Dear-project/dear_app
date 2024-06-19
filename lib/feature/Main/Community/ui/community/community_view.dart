import 'package:dear_app/feature/main/community/component/community/community_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CommunityCell(),
            CommunityCell(),
            CommunityCell(),
          ],
        ),
      ),
    );
  }
}
