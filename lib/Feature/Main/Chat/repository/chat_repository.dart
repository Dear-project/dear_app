import 'dart:io';

import 'package:dear_app/Feature/Main/Chat/api/chat_api_service.dart';
import 'package:dear_app/Feature/Main/Chat/model/message_request.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_request.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_response.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class ChatRepository {
  Future<ApiResponse> getRooms();
  Future<ApiResponse> createRoom( RoomRequest roomRequest );
  Future<ApiResponse> getRoombyId( String roomId, int userId );
  Future<ApiResponse> getMessages( String roomId, int? userId, MessageRequest? pageable );
}

class ChatRepositoryImpl implements ChatRepository {
  final _apiService = ChatApiService(HttpClient().client);

  @override
  Future<ApiResponse> getRooms() async {
    ApiResponse apiResponse = await _apiService.getRooms().then((
        httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode,
          data: httpResponse.data
      );
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest : e.response!.statusCode!,
          (e.response == null)
              ? "클라이언트 에러" : e.response!.statusMessage!
      );
    });

    return apiResponse;
  }

  @override
  Future<ApiResponse> createRoom(RoomRequest roomRequest) async {
    ApiResponse apiResponse = await _apiService.createRoom(roomRequest).then((
        httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode,
          data: httpResponse.data
      );
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest : e.response!.statusCode!,
          (e.response == null)
              ? "클라이언트 에러" : e.response!.statusMessage!
      );
    });

    return apiResponse;
  }

  @override
  Future<ApiResponse> getRoombyId(String roomId, int user) async {
    return ApiResponse.error(400, "아직 구현 안함");
  }

  @override
  Future<ApiResponse> getMessages(String roomId, int? userId, MessageRequest? pageable) async {
    ApiResponse apiResponse = await _apiService.getMessages(roomId, userId, pageable).then((
        httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode,
          data: httpResponse.data
      );
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest : e.response!.statusCode!,
          (e.response == null)
              ? "클라이언트 에러" : e.response!.statusMessage!
      );
    });

    return apiResponse;
  }
}