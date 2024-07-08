import 'package:dear_app/Feature/Main/Community/component/community/community_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Column(
            children: [
              for(var i = 0; i<10; i++)
                Column(
                  children: [
                    CommunityCell(),
                    SizedBox(height: 6,)
                  ],
                ),
              SizedBox(
                height: 100,
              )

            ],
          ),
        ),
    );
  }
}
