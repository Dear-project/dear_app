import 'package:dear_app/Feature/Main/Shared/component/matching_request_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRequestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MatchingRequestCell()
      ],
    );
  }
}