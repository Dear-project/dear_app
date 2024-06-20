import 'dart:io';

import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dear_app/Feature/Auth/Signin/api/signin_api_service.dart';
import 'package:dear_app/Feature/Auth/Signin/model/signin_request.dart';
import 'package:dio/dio.dart';

abstract class SignInRepository {
  Future<ApiResponse>  signIn({required SignInRequest signInRequest});
}


class SignInRepositoryImpl implements SignInRepository {
  final _apiService  = SignInApiService(HttpClient().client) ;
  @override
  Future<ApiResponse> signIn({required SignInRequest signInRequest}) async {
    ApiResponse apiResponse =
        await _apiService.signIn(signInRequest).then((httpResponse) async {
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

}