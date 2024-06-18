import 'dart:io';

import 'package:dear_app/Feature/Main/Profile/api/profile_api_service.dart';
import 'package:dear_app/Shared/net/http_client.dart';

import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dio/dio.dart';

abstract class ProfileRepository {
  Future<ApiResponse> getProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final _apiService = ProfileApiService(HttpClient().client);

  @override
  Future<ApiResponse> getProfile() async {
    // 실제 베어러를 박아야 합니다. 
    ApiResponse apiResponse = await _apiService.getProfile('Bearer eyJKV1QiOiJBQ0NFU1MiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnc2JhbGwzOTlAZ21haWwuY29tIiwiYXV0aG9yaXR5IjoiVVNFUiIsImlhdCI6MTcxODY2NzE1NSwiZXhwIjoxNzE4NzEwMzU1fQ.U1WtAz7zmu3NcY-sExrmmIVVsbgYQxy5yoBvAIdENxA').then((httpResponse) async {
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