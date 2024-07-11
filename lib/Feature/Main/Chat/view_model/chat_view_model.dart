import 'dart:io';

import 'package:dear_app/Feature/Main/Chat/model/room_request.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_response.dart';
import 'package:dear_app/Feature/Main/Chat/repository/chat_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:get/get.dart';

class ChatViewModel extends GetxController {
  final ChatRepository _repository = ChatRepositoryImpl();
  Rxn<List<RoomResponse>> roomList = Rxn<List<RoomResponse>>([]);

  void getRooms() async {
    ApiResponse apiResponse = await _repository.getRooms();

    if (apiResponse.statusCode == HttpStatus.ok) {

      List<RoomResponse> response = List<RoomResponse>.from(apiResponse.data.map((e) => RoomResponse.fromJson(e as Map<String, dynamic>)).toList());

      roomList.value = response;
    }
  }

  void createRoom(RoomRequest roomRequest) async {
    ApiResponse apiResponse = await _repository.createRoom(roomRequest);

    if(apiResponse.statusCode == HttpStatus.ok) {
      Utils.toastMessage("채팅 방이 개설되었습니다");
      Get.back();
    }
  }
}