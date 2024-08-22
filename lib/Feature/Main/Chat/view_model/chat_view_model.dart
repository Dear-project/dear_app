import 'dart:convert';
import 'dart:io';

import 'package:dear_app/Feature/Main/Chat/model/message_request.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_request.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_response.dart';
import 'package:dear_app/Feature/Main/Chat/repository/chat_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:get/get.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class ChatViewModel extends GetxController {
  final ChatRepository _repository = ChatRepositoryImpl();
  Rxn<List<RoomResponse>> roomList = Rxn<List<RoomResponse>>([]);
  int clickedIndex = 0;
  String? accessToken;

  StompClient? stompClient;
  RoomResponse? currentValue;


  void onConnect(StompFrame frame) {

    stompClient!.subscribe(
        destination: "/exchange/chat.exchange/room.${currentValue?.id ?? ""}",
        headers: {
          "Authorization": "Bearer $accessToken"
        },
        callback: (StompFrame frame) {
          if (frame.body != null) {
            Map<String, dynamic> object = json.decode(frame.body!);
            print(object);
          }
          else {
            print("body is null");
          }
        });



  }

  void sendMessage(String message) {
    if (stompClient == null) {
      return;
    }

    print(currentValue?.toJson());

    stompClient!.send(
        destination: "/pub/chat.exchange",
      headers: {
        "Authorization": "Bearer $accessToken"
      },
      body: jsonEncode(
          {
            "roomId": currentValue?.id,
            "type": "message",
            "message": message
          }
      )
    );
  }


  void getRooms() async {
    ApiResponse apiResponse = await _repository.getRooms();

    if (apiResponse.statusCode == HttpStatus.ok) {
      List<RoomResponse> response = List<RoomResponse>.from(
          apiResponse.data.map((e) =>
              RoomResponse.fromJson(e as Map<String, dynamic>)).toList());

      roomList.value = response;
    }
  }

  void createRoom(RoomRequest roomRequest) async {
    ApiResponse apiResponse = await _repository.createRoom(roomRequest);

    if (apiResponse.statusCode == HttpStatus.ok) {
      Utils.toastMessage("채팅 방이 개설되었습니다");
      Get.back();
    }
  }

  void getRoombyId(String roomId, int userId) async {
    ApiResponse apiResponse = await _repository.getRoombyId(roomId, userId);

    if (apiResponse.statusCode == HttpStatus.ok) {

    }
  }

  void getMessages() async {
    currentValue = roomList.value?[clickedIndex];

    ApiResponse apiResponse = await _repository.getMessages(currentValue!.id, null, null);

    print(apiResponse.data);
  }

}