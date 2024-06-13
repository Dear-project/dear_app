import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';


@RestApi(baseUrl: BASE_URL)
abstract class SignInApiService {

  @POST('/auth')
  Future<HttpResponse> signin(@Query("email") String email, @Query("password") String password);
}