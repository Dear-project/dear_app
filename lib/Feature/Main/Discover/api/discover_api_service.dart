import 'package:dear_app/Feature/Main/Discover/model/discover_request.dart';
import 'package:dear_app/Feature/Main/Discover/model/matching_request.dart';
import 'package:dear_app/Feature/Main/Home/enums/bookmark_type.dart';
import 'package:dear_app/Shared/model/authentication.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'discover_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class DiscoverApiService {
  factory DiscoverApiService(Dio dio) = _DiscoverApiService;

  @GET('/professor')
  Future<HttpResponse> getProfessor(
      @Query("page") int page, @Query("size") int size);

  @GET('/matching')
  Future<HttpResponse> getMachingRequest(
      @Query("page") int page, @Query("size") int size);

  @POST('/matching')
  Future<HttpResponse> sendMatchingRequest(
      {@Body() MatchingRequest? matchingRequest});

  @POST('/matching/reject')
  Future<HttpResponse> rejectMatchingRequest(
      {@Body() MatchingRequest? matchingRequest});

  @POST('/matching/accept')
  Future<HttpResponse> acceptMatchingRequest(
      {@Body() MatchingRequest? matchingRequest});

  @GET('/bookmark')
  Future<HttpResponse> getBookmark(
      @Query("page") int page, @Query("size") int size);

  @POST('/bookmark/{id}')
  Future<HttpResponse> postBookmark(@Path("id") int id, BookmarkType type);
}
