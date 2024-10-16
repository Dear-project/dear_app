import 'dart:io';

import 'package:dear_app/Feature/Main/Discover/api/discover_api_service.dart';
import 'package:dear_app/Feature/Main/Discover/model/discover_request.dart';
import 'package:dear_app/Feature/Main/Discover/model/matching_request.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class DiscoverRepository {
  Future<ApiResponse> getProfessor({required DiscoverRequest discoverRequest});
  Future<ApiResponse> sendMatchingRequest({required MatchingRequest? matchingRequest});
}

class DiscoverRepositoryImpl implements DiscoverRepository {
  final _apiService = DiscoverApiService(HttpClient().client);

  @override
  Future<ApiResponse> getProfessor({required DiscoverRequest discoverRequest}) async {
    ApiResponse apiResponse = await _apiService.getProfessor(discoverRequest.page, discoverRequest.size).then((httpResponse) async {
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
  Future<ApiResponse> sendMatchingRequest({required MatchingRequest? matchingRequest}) async {
    ApiResponse apiResponse = await _apiService.sendMatchingRequest(matchingRequest: matchingRequest).then((httpResponse) async {
      return ApiResponse(
          statusCode: httpResponse.response.statusCode,
          data: httpResponse.data
      );
    }).onError((DioException e, stackTrace) async {
      print(e);

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
