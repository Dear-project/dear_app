import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class CommentApiService {
  factory CommentApiService(Dio dio) = _CommentApiService;

  @GET("/comment/{id}")
  Future<HttpResponse> getComments(@Path("id") int id, @Query("page") int page, @Query("size") int size);
}