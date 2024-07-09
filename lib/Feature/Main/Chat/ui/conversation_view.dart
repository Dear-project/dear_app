import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_app/Feature/Main/Chat/component/chat_list_item.dart';
import 'package:dear_app/Feature/Main/Chat/view_model/conversation_view_model.dart';
import 'package:dear_app/Shared/component/custom_indicator_dialog.dart';
import 'package:dear_app/Shared/component/dear_top_tab_bar.dart';
import 'package:dear_app/Shared/component/no_data.dart';
import 'package:dear_app/Shared/constants/constants.dart';
import 'package:dear_app/Shared/controller/user_controller.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/message.dart';
import 'package:dear_app/Shared/repository/user_repository.dart';
import 'package:dear_app/Shared/service/message_service.dart';
import 'package:dear_app/Shared/theme/dear_badge.dart';
import 'package:dear_app/shared/theme/dear_color.dart';
import 'package:dear_app/shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class ConversationView extends StatefulWidget {
  const ConversationView({super.key});

  @override
  State<ConversationView> createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  final _vm = Get.put(ConversationViewModel());
  final UserController userController = Get.find();

  @override
  void initState() {
    super.initState();

    _vm.getConversations(email: userController.user.value.email ?? "");
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DearColors.white,
      appBar: AppBar(
        backgroundColor: DearColors.white,
        toolbarHeight: 40,
        elevation: 0,
        title: Text(
          "채팅",
          style: TextStyle(
              fontFamily: "Pretendard",
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                  width: 22,
                  height: 25,
                  child: Stack(alignment: Alignment.topRight, children: [
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: DearIcons.bell,
                        onPressed: () {}),
                    DearBadge()
                  ])))
        ],
      ),
      body: SafeArea(
        child: Expanded(
          child: Obx(
            () {
              try {
                QuerySnapshot<Map<String, dynamic>> conversations =
                    _vm.conversations;
                if (conversations.docs.isNotEmpty) {
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 10),
                    itemCount: conversations.docs.length,
                    itemBuilder: ((context, index) {
                      final DocumentSnapshot<Map<String, dynamic>>
                          conversation = conversations.docs[index];
                      return ChatListItem(
                        conversation: conversation,
                        onTap: handleTap,
                      );
                    }),
                  );
                } else {
                  return const NoData(svgName: 'chat', text: "대화가 없습니다.");
                }
              } catch (e) {
                return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor));
              }
            },
          ),
        ),
      ),
    );
  }

  void handleTap(
      {required DocumentSnapshot<Map<String, dynamic>> conversation}) async {
    // Handle the tap event here, e.g., navigate to a chat screen
    print('Tapped on conversation: ${conversation[USER_ID]}');
    CustomIndicatorDialog pr =
        CustomIndicatorDialog(context, isDismissible: false);
    await pr.show();

    await _vm.toChatView(conversation: conversation, onSuccess: () async {
      await pr.hide();
    },);

    // await pr.hide();
  }
}
