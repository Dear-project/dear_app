import 'dart:io';

import 'package:dear_app/Feature/Main/Profile/api/profile_api_service.dart';
import 'package:dear_app/Shared/net/http_client.dart';

import 'package:dear_app/Shared/model/api_response.dart';

abstract class ProfileRepository {
  Future<ApiResponse> getProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final _apiService = ProfileApiService(HttpClient().client);

  @override
  Future<ApiResponse> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

}