import 'dart:io';

import 'package:dear_app/Feature/Main/Chat/api/chat_api_service.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_request.dart';
import 'package:dear_app/Feature/Main/Chat/model/room_response.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class ChatRepository {
  Future<ApiResponse> getRooms();
  Future<ApiResponse> createRoom(RoomRequest roomRequest);
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
}