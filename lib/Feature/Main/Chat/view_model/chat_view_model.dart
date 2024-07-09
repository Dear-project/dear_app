import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_app/Shared/controller/user_controller.dart';
import 'package:dear_app/Shared/model/message.dart';
import 'package:dear_app/Shared/service/message_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ChatViewModel extends GetxController {
  final _limit = 20;
  late String _revEmail = '';

  final UserController userController = Get.find();
  final textController = TextEditingController().obs;
  final messageScrollController = ScrollController().obs;
  RxList<DocumentSnapshot<Map<String, dynamic>>> messages = RxList();

  final PagingController<int, DocumentSnapshot<Map<String, dynamic>>>
      pagingController = PagingController(firstPageKey: 1);

  final _messageService = MessageServiceImpl();

  Future<void> setup({required String email}) async {
    await _messageService.clear();
    _revEmail = email;
    messagesListener();
    pagingController.addPageRequestListener((pageKey) {
      _fetchMessages(pageKey);
    });
  }

  Future<void> send({required Message message}) async {


    await _messageService.send(
        type: message.type,
        fromUserId: message.senderUserID,
        senderId: message.senderUserID,
        receiverId: message.receiverUserID,
        userPhotoLink: message.receiverUserProfile,
        userFullName: message.receiverUserName,
        textMsg: message.textMsg ?? "",
        imgLink: null,
        isRead: true);

    await _messageService.send(
        type: message.type,
        fromUserId: message.senderUserID,
        senderId: message.receiverUserID,
        receiverId: message.senderUserID,
        userPhotoLink: message.senderUserProfile,
        userFullName: message.senderUserName,
        textMsg: message.textMsg ?? "",
        imgLink: null,
        isRead: false);

  }

  Future<void> _fetchMessages(int pageKey) async {
    try {
      List<DocumentSnapshot<Map<String, dynamic>>> newItems =
          await getMoreMessages(_revEmail);
      final isLastPage = newItems.length < _limit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<void> messagesListener() async {
    getMessages(withUserId: _revEmail)
        .listen((QuerySnapshot<Map<String, dynamic>> messageDoc) {
      if (messageDoc.docs.isEmpty) return;
      messages.value = messageDoc.docs.toList();
      pagingController.nextPageKey = 1;
      pagingController.itemList = messages.value;
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      {required String withUserId}) {
    return _messageService.getMessages(sendEmail:  userController.user.value.email ?? "", revEmail: withUserId);
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getMoreMessages(
      String withUserId) async {
    return _messageService.getMoreMessages(
        sendEmail: userController.user.value.email ?? "", revEmail: withUserId, limit: 20);
  }

  Future<void> scrollMessageList() async {
    if (messageScrollController.value.hasClients) {
      messageScrollController.value.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }
}
