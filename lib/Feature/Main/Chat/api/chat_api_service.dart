import 'package:dear_app/Feature/Main/Chat/model/room_request.dart';
import 'package:dear_app/Shared/net/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ChatApiService {
  factory ChatApiService(Dio dio) = _ChatApiService;

  @GET('/chat/get')
  Future<HttpResponse> getRooms();

  @POST('/chat/create')
  Future<HttpResponse> createRoom(@Body() RoomRequest roomRequest);
}