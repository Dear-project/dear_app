import 'dart:convert';
import 'dart:io';

import 'package:dear_app/Feature/Main/Chat/model/message_request.dart';
import 'package:dear_app/Feature/Main/Chat/model/message_response.dart';
import 'package:dear_app/Feature/Main/Chat/model/messages_response.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_response.dart';
import 'package:dear_app/Feature/Main/Chat/repository/chat_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class ChatViewModel extends GetxController {
  final ChatRepository _repository = ChatRepositoryImpl();
  Rxn<List<RoomResponse>> roomList = Rxn<List<RoomResponse>>([]);

  Rxn<List<MessageResponse>> messages = Rxn<List<MessageResponse>>([]);

  int clickedIndex = 0;
  String? accessToken;

  StompClient? stompClient;
  RoomResponse? currentValue;

  final scrollController = ScrollController();

  int page = 1;

  void onConnect(StompFrame frame) {
    stompClient!.subscribe(
        destination: "/exchange/chat.exchange/room.${currentValue?.id ?? ""}",
        headers: {
          "Authorization": "Bearer $accessToken"
        },
        callback: (StompFrame frame) {
          if (frame.body != null) {
            Map<String, dynamic> object = json.decode(frame.body!);

            MessageResponse response = MessageResponse.fromJson(object);
            messages.value!.insert(0, response);
            messages.refresh();

            scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.linear);
          }
        });

  }

  void sendMessage(String message) {
    if (stompClient == null) {
      return;
    }

    if (message.isEmpty || message.trim().isEmpty) {
      return;
    }

    stompClient!.send(
        destination: "/pub/chat.message",
      headers: {
        "Authorization": "Bearer $accessToken"
      },
      body: jsonEncode(
          {
            "roomId": currentValue!.id,
            "type": "MESSAGE",
            "message": message.trim()
          }
      )
    );

  }

  void getRooms(int userId) async {
    ApiResponse apiResponse = await _repository.getRooms(userId);

    if (apiResponse.statusCode == HttpStatus.ok) {
      List<RoomResponse> response = List<RoomResponse>.from(
          apiResponse.data.map((e) =>
              RoomResponse.fromJson(e as Map<String, dynamic>)).toList());

      roomList.value = response;
    }
  }

  void getRoombyId(String roomId, int userId) async {
    ApiResponse apiResponse = await _repository.getRoombyId(roomId, userId);

    if (apiResponse.statusCode == HttpStatus.ok) {

    }
  }

  void getMessages() async {
    currentValue = roomList.value?[clickedIndex];

    ApiResponse apiResponse = await _repository.getMessages(currentValue!.id, null, MessageRequest(page: page, size: 10));

    if (apiResponse.statusCode == HttpStatus.ok) {
      MessagesResponse messagesResponse = MessagesResponse.fromJson(apiResponse.data);

      messages.value = messagesResponse.messages;
    }

  }

}