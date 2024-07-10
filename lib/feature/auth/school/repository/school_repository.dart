import 'dart:io';

import 'package:dear_app/Feature/Auth/School/api/school_api_service.dart';
import 'package:dear_app/Feature/Auth/School/model/register_major_request.dart';
import 'package:dear_app/Feature/Auth/School/model/register_school_request.dart';
import 'package:dear_app/Feature/Auth/School/model/search_major_request.dart';
import 'package:dear_app/Feature/Auth/School/model/search_school_request.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class SchoolRepository {
  Future<ApiResponse> search(
      {required SearchSchoolRequest searchSchoolRequest});

  Future<ApiResponse> searchMajor(
      {required SearchMajorRequest searchMajorRequest});

  Future<ApiResponse> registerSchool(
  {required RegisterSchoolRequest registerSchoolRequest});

  Future<ApiResponse> registerMajor(
  {required RegisterMajorRequest registerMajorRequest});
}

class SchoolRepositoryImpl implements SchoolRepository {
  final _apiService = SchoolApiService(HttpClient().client);

  @override
  Future<ApiResponse> search(
      {required SearchSchoolRequest searchSchoolRequest}) async {
    ApiResponse apiResponse = await _apiService
        .search(searchSchoolRequest.gubunType, searchSchoolRequest.keyword)
        .then((httpResponse) async {
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
  Future<ApiResponse> searchMajor(
      {required SearchMajorRequest searchMajorRequest}) async {
    ApiResponse apiResponse = await _apiService
        .searchMajor(searchMajorRequest.keyword)
        .then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data);
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!);
    });
    return apiResponse;
  }

  Future<ApiResponse> registerSchool({required RegisterSchoolRequest registerSchoolRequest}) async {
    ApiResponse apiResponse = await _apiService
        .registerSchool(registerSchoolRequest)
        .then((httpResponse) async {
          return ApiResponse(
            statusCode: httpResponse.response.statusCode!,
            data: httpResponse.data);
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
        ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!
      );
    });

    return apiResponse;
  }

  Future<ApiResponse> registerMajor({required RegisterMajorRequest registerMajorRequest}) async {
    ApiResponse apiResponse = await _apiService
        .registerMajor(registerMajorRequest)
        .then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode!,
          data: httpResponse.data);
    }).onError((DioException e, stackTrace) async {
      return ApiResponse.error(
          (e.response == null)
              ? HttpStatus.badRequest
              : e.response!.statusCode!,
          (e.response == null) ? "" : e.response!.statusMessage!
      );
    });

    return apiResponse;
  }
}
