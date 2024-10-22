import 'package:dear_app/Feature/Main/Community/model/post_request.dart';
import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'community_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class CommunityApiService {
  factory CommunityApiService(Dio dio) = _CommunityApiService;

  @GET('/community')
  Future<HttpResponse> getPosts(@Query("page") int page, @Query("size") int size);
  
  @POST('/community')
  Future<HttpResponse> addPosts();

  @PATCH('/community/{id}')
  Future<HttpResponse> patchPosts(@Path("id") int id, @Body() PostRequest body);
  
  @GET('/community/{id}')
  Future<HttpResponse> getPostbyId(@Path("id") int id);

  @GET('/community/my-articles')
  Future<HttpResponse> getPostsMy(@Query("page") int page, @Query("size") int size);
}