import 'dart:io';

import 'package:dear_app/feature/auth/school/api/school_api_service.dart';
import 'package:dear_app/feature/auth/school/model/search_school_request.dart';
import 'package:dear_app/shared/model/api_response.dart';
import 'package:dear_app/shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class SchoolRepository {
  Future<ApiResponse>  search({required SearchSchoolRequest searchSchoolRequest});
  Future<ApiResponse>  searchMajor({required SearchSchoolRequest searchSchoolRequest});
}

class SchoolRepositoryImpl implements SchoolRepository{
  final _apiService  = SchoolApiService(HttpClient().client) ;
  @override
  Future<ApiResponse> search({required SearchSchoolRequest searchSchoolRequest}) async {
    ApiResponse apiResponse =
    await _apiService.search(searchSchoolRequest.gubunType, searchSchoolRequest.keyword).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!);
    });
    return apiResponse;
  }

  @override
  Future<ApiResponse> searchMajor({required SearchSchoolRequest searchSchoolRequest}) async {
    ApiResponse apiResponse =
    await _apiService.searchMajor(searchSchoolRequest.gubunType, searchSchoolRequest.keyword).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data ?? "");
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!);
    });
    return apiResponse;
  }

}