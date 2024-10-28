import 'dart:io';

import 'package:dear_app/Feature/Main/Community/api/comment_api_service.dart';
import 'package:dear_app/Feature/Main/Community/model/comment_request.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/net/http_client.dart';
import 'package:dio/dio.dart';

abstract class CommentRepository {
  Future<ApiResponse> getComments(int id);
  Future<ApiResponse> postComment(CommentRequest body);
}

class CommentRepositoryImpl implements CommentRepository {
  final _apiService = CommentApiService(HttpClient().client);


  @override
  Future<ApiResponse> getComments(int id) async {
    ApiResponse apiResponse = await _apiService.getComments(id, 1, 10).then((
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
  Future<ApiResponse> postComment(CommentRequest body) async {
    ApiResponse apiResponse = await _apiService.postComment(body).then((
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