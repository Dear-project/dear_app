import 'dart:io';

import 'package:dear_app/Feature/Main/Profile/api/profile_api_service.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';
import 'package:dear_app/Shared/model/api_response.dart';

abstract class ProfileRepository {
  Future<ApiResponse> getProfile();
  Future<ApiResponse> setProfileImage(File file);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final _apiService = ProfileApiService(HttpClient().client);

  @override
  Future<ApiResponse> getProfile() async {
    ApiResponse apiResponse = await _apiService.getProfile().then((httpResponse) async {
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
  Future<ApiResponse> setProfileImage(File file) async {

    print(file);

    ApiResponse apiResponse = await _apiService.setProfileImage(file: file).then((httpResponse) async {
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