import 'package:dear_app/Feature/Auth/Signin/api/signin_api_service.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

class _SignUpApiService implements SignInApiService {

  final Dio _dio;
  String? baseUrl;

  _SignUpApiService(this._dio, {
    this.baseUrl
  }) {

  }

  @override
  Future<HttpResponse> signin(String email, String password) {
    // TODO: implement signin
    throw UnimplementedError();
  }

}