import 'dart:io';

import 'package:dear_app/Feature/Main/Home/api/home_api_service.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class HomeRepository {
  Future<ApiResponse> getBanner();
  Future<ApiResponse> getSchedule();
}

class HomeRepositoryImpl implements HomeRepository {
  final _apiService = HomeApiService(HttpClient().client);

  @override
  Future<ApiResponse> getBanner() async {
    ApiResponse apiResponse = await _apiService.getBanner().then((httpResponse) async {
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
  Future<ApiResponse> getSchedule() async {
    ApiResponse apiResponse = await _apiService.getSchedule().then((httpResponse) async {
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