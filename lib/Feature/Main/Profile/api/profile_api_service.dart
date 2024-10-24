import 'dart:io';

import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @GET('/profile')
  Future<HttpResponse> getProfile();

  @POST('/profile/image')
  @MultiPart()
  Future<HttpResponse> setProfileImage({
      @Part() File? file
    });
  
  @DELETE('/user')
  Future<HttpResponse> deleteUser();

}