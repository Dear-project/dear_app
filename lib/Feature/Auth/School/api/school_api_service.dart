
import 'package:dear_app/Feature/Auth/school/model/search_major_response.dart';
import 'package:dear_app/Feature/Auth/school/model/search_school_response.dart';
import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'school_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SchoolApiService {
  factory SchoolApiService(Dio dio) = _SchoolApiService;

  @GET('/school/list')
  Future<HttpResponse<SearchSchoolResponse>> search(@Query('gubunType') String gubunType, @Query('keyword') String keyword);

  @GET('/school/major/list')
  Future<HttpResponse<SearchMajorResponse>> searchMajor(@Query('gubunType') String gubunType, @Query('keyword') String keyword);

}
