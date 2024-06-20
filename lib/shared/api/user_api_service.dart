
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class UserApiService {

  factory UserApiService(Dio dio) = _UserApiService;

  @GET('/profile')
  Future<HttpResponse<ResponseData<UserProfileResponse>>> profile();

}