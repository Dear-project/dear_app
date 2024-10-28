import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:dear_app/Feature/Main/Community/model/comment_request.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class CommentApiService {
  factory CommentApiService(Dio dio) = _CommentApiService;

  @GET("/comment/{id}")
  Future<HttpResponse> getComments(@Path("id") int id, @Query("page") int page, @Query("size") int size);

  @POST("/comment")
  Future<HttpResponse> postComment(@Body() CommentRequest body);
}