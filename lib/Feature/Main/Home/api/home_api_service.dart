import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET('/banner/active')
  Future<HttpResponse> getBanner();

  @GET('/schedule')
  Future<HttpResponse> getSchedule();
}