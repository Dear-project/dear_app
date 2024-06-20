import 'package:dear_app/Feature/Auth/Signup/model/signup_request.dart';
import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'signup_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio) = _SignUpApiService;

  @POST('/auth/signup')
  Future<HttpResponse> signup(@Body() SignupRequest request);


  @POST('/auth/email')
  Future<HttpResponse> emailVerification(@Query("email") String email);

  @GET('/auth/email/verifications')
  Future<HttpResponse> verificationAuthNumber(@Query("email") String email, @Query("authCode") String authCode);

}
