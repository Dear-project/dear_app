import 'dart:io';

import 'package:dear_app/Feature/Main/Community/api/community_api_service.dart';
import 'package:dear_app/Feature/Main/Community/model/post_request.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class CommunityRepository {
  Future<ApiResponse> getPosts();
  Future<ApiResponse> addPosts();
  Future<ApiResponse> patchPosts(int id, PostRequest body);
  Future<ApiResponse> getPostbyId(int id);
  Future<ApiResponse> getPostsMy();
}

class CommunityRepositoryImpl implements CommunityRepository {
  final _apiService = CommunityApiService(HttpClient().client);

  @override
  Future<ApiResponse> getPosts() async {
    ApiResponse apiResponse = await _apiService.getPosts(1, 100).then((
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
  Future<ApiResponse> addPosts() async {
    ApiResponse apiResponse = await _apiService.addPosts().then((
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
  Future<ApiResponse> patchPosts(int id, PostRequest body) async {
    ApiResponse apiResponse = await _apiService.patchPosts(id, body).then((
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
  Future<ApiResponse> getPostbyId(int id) async {
    ApiResponse apiResponse = await _apiService.getPostbyId(id).then((
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
  Future<ApiResponse> getPostsMy() async {
    ApiResponse apiResponse = await _apiService.getPostsMy(1, 100).then((
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