import 'package:dear_app/shared/model/authentication.dart';
import 'package:dear_app/feature/auth/signin/model/signin_request.dart';
import 'package:dear_app/shared/model/response_data.dart';
import 'package:dear_app/shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'signin_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SignInApiService {

  factory SignInApiService(Dio dio) = _SignInApiService;

  @POST('/auth')
  Future<HttpResponse<ResponseData<Authentication>>> signIn(@Body() SignInRequest signInRequest);

}