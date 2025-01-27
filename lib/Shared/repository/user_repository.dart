import 'dart:io';

import 'package:dear_app/Shared/api/user_api_service.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class UserRepository {
  Future<ApiResponse> getProfile();
  Future<ApiResponse> getProfileByEmail({required String email});

}

class UserRepositoryImpl implements UserRepository {
  final _apiService = UserApiService(HttpClient().client);

  @override
  Future<ApiResponse> getProfile() async {
    ApiResponse apiResponse =
        await _apiService.profile().then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data);
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }

  @override
  Future<ApiResponse> getProfileByEmail({required String email}) async {
    ApiResponse apiResponse =
    await _apiService.getProfileByEmail(email).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data);
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }
}
