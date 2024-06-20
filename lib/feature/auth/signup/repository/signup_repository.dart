import 'dart:io';

import 'package:dear_app/Feature/Auth/Signup/api/signup_api_service.dart';
import 'package:dear_app/Feature/Auth/Signup/model/email_auth_number_request.dart';
import 'package:dear_app/Feature/Auth/Signup/model/signup_request.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class SignUpRepository {
  Future<ApiResponse> signup({required SignupRequest signupRequest});

  Future<ApiResponse> emailVerification({required String email});

  Future<ApiResponse> verificationAuthNumber(
      {required EmailAuthNumberRequest emailAuthNumberRequest});
}

class SignUpRepositoryImpl implements SignUpRepository {
  final _apiService = SignUpApiService(HttpClient().client);

  @override
  Future<ApiResponse> emailVerification({required String email}) async {
    ApiResponse apiResponse =
        await _apiService.emailVerification(email).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
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
  Future<ApiResponse> verificationAuthNumber(
      {required EmailAuthNumberRequest emailAuthNumberRequest}) async {
    ApiResponse apiResponse = await _apiService
        .verificationAuthNumber(
            emailAuthNumberRequest.email, emailAuthNumberRequest.authCode)
        .then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response != null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response != null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }

  @override
  Future<ApiResponse> signup({required SignupRequest signupRequest}) async {
    ApiResponse apiResponse =
        await _apiService.signup(signupRequest).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response != null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response != null) ? "" : e.response!.statusMessage!);
    }).catchError((onError) {
      return ApiResponse.error(HttpStatus.badRequest, "");
    });
    return apiResponse;
  }
}
