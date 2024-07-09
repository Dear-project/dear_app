import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_app/Feature/Main/Chat/component/chat_message.dart';
import 'package:dear_app/Feature/Main/Chat/view_model/chat_view_model.dart';
import 'package:dear_app/Shared/constants/constants.dart';
import 'package:dear_app/Shared/controller/user_controller.dart';
import 'package:dear_app/Shared/model/message.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:dear_app/shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:timeago/timeago.dart' as timeago;

class Chat2View extends StatefulWidget {
  final UserProfileResponse revUser;

  const Chat2View({Key? key, required this.revUser}) : super(key: key);

  @override
  _Chat2ViewState createState() => _Chat2ViewState();
}

class _Chat2ViewState extends State<Chat2View>
    with AutomaticKeepAliveClientMixin {
  final _vm = Get.put(ChatViewModel());
  final UserController userController = Get.find();

  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('ko', timeago.KoMessages());
    _vm.setup(email: widget.revUser.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: GestureDetector(
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 0),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: (widget.revUser.imgPath == null)
                    ? DearIcons.my.image
                    : NetworkImage(widget.revUser.imgPath!),
                onBackgroundImageError: (e, s) => {debugPrint(e.toString())},
              ),
              title: Text(
                widget.revUser.name,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {},
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
                initialValue: "",
                splashRadius: 10,
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem(
                          value: "delete_chat",
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.delete,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '대화삭제',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          )),
                      const PopupMenuDivider(),
                      const PopupMenuItem(
                          value: "delete_match",
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.block,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '차단',
                                style: TextStyle(fontSize: 17),
                              )
                            ],
                          )),
                    ])
          ]),
      body: SafeArea(
        child: Column(
          children: [_showMessages(), _input()],
        ),
      ),
    );
  }

  Widget _input() {
    return Container(
      color: Colors.grey.withAlpha(30),
      child: ListTile(
        leading: IconButton(
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 20,
            ),
            onPressed: () async {}),
        title: TextField(
          controller: _vm.textController.value,
          minLines: 1,
          maxLines: 4,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: '',
            filled: true,
            isDense: true,
            contentPadding: const EdgeInsets.all(8),
            fillColor: Colors.white.withOpacity(0.9),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          keyboardType: TextInputType.multiline,
          onChanged: (text) {},
        ),
        trailing: InkWell(
          onTap: () async {
            final text = _vm.textController.value.text.trim();
            if (text.isEmpty) {
              return;
            }
            _vm.textController.value.clear();
            await _sendMessage(type: 'text', text: text);
            await _vm.scrollMessageList();
          },
          child: const Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: 40,
              child: Icon(
                Icons.send,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _sendMessage(
      {required String type, String? text, File? imgFile}) async {
    Message message = Message(
        type: type,
        textMsg: text,
        imgFile: imgFile,
        senderUserID: userController.user.value.email ?? "",
        senderUserName: userController.user.value.name ?? "",
        senderUserProfile: userController.user.value.imgPath ?? "",
        receiverUserID: widget.revUser.email,
        receiverUserName: widget.revUser.name,
        receiverUserProfile: widget.revUser.imgPath ?? "");
    await _vm.send(message: message);
  }

  Widget _showMessages() {
    return Obx(() => Flexible(
        child: _vm.messages.value.isEmpty
            ? CupertinoActivityIndicator()
            : PagedListView<int, DocumentSnapshot<Map<String, dynamic>>>(
                reverse: true,
                pagingController: _vm.pagingController,
                scrollController: _vm.messageScrollController.value,
                builderDelegate: PagedChildBuilderDelegate<
                    DocumentSnapshot<Map<String, dynamic>>>(
                  animateTransitions: true,
                  itemBuilder: (context, item, index) {
                    final Map<String, dynamic> msg = item.data()!;
                    print(msg[MESSAGE_TEXT]);
                    bool isUserSender;
                    String? userPhotoLink;
                    final bool isImage = msg[MESSAGE_TYPE] == 'image';
                    final String textMessage = msg[MESSAGE_TEXT];
                    final String? imageLink = msg[MESSAGE_IMG_LINK];
                    String timeAgo = '';
                    try {
                      timeAgo =
                          timeago.format(msg[TIMESTAMP].toDate(), locale: 'ko');
                    } catch (e) {}

                    if (msg[USER_ID] == userController.user.value.email) {
                      isUserSender = true;
                      userPhotoLink = userController.user.value.imgPath;
                    } else {
                      isUserSender = false;
                      userPhotoLink = widget.revUser.imgPath;
                    }

                    return ChatMessage(
                      isUserSender: isUserSender,
                      isImage: isImage,
                      userPhotoLink: userPhotoLink,
                      textMessage: textMessage,
                      imageLink: imageLink,
                      timeAgo: timeAgo ?? "",
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context) => Container(),
                  firstPageErrorIndicatorBuilder: (context) => Container(),
                ))));
  }

  @override
  void dispose() {
    _vm.textController.value.dispose();
    _vm.messageScrollController.value.dispose();
    _vm.dispose();
    Get.delete<ChatViewModel>();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
