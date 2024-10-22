import 'dart:io';

import 'package:dear_app/Feature/Main/Community/model/community_response.dart';
import 'package:dear_app/Feature/Main/Community/model/post_id_response.dart';
import 'package:dear_app/Feature/Main/Community/model/post_request.dart';
import 'package:dear_app/Feature/Main/Community/repository/community_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommunityViewModel extends GetxController {
  final CommunityRepository _repositoy = CommunityRepositoryImpl();
  Rxn<List<CommunityResponse>> model = Rxn<List<CommunityResponse>>([]);
  Rxn<CommunityResponse> idInfo = Rxn<CommunityResponse>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void initTextController() {
    titleController.text = "";
    contentController.text = "";
  }

  void getPosts() async {
    ApiResponse apiResponse = await _repositoy.getPosts();

    if (apiResponse.statusCode == HttpStatus.ok) {
      ResponseData<List<CommunityResponse>> communityResponse = ResponseData.fromJson(apiResponse.data, (json) => (json as List).map((e) => CommunityResponse.fromJson(e)).toList());

      model.value = communityResponse.data;
    }
  }

  void addPosts() async {
    ApiResponse apiResponse = await _repositoy.addPosts();

    if (apiResponse.statusCode == HttpStatus.ok) {
      ResponseData<PostIDResponse> dt = ResponseData.fromJson(apiResponse.data, (json) => PostIDResponse.fromJson(json as Map<String, dynamic>));
      patchPosts(dt.data.id);
    }
  }

  void patchPosts(int id) async {
    ApiResponse apiResponse = await _repositoy.patchPosts(id, PostRequest(title: titleController.text, content: contentController.text));
    print(id);
    print([apiResponse.statusCode, apiResponse.errorMessage]);
    if (apiResponse.statusCode == HttpStatus.ok) {
      Get.back();
      getPosts();
    }
  }

  void getPostbyId(int id) async {
    ApiResponse apiResponse = await _repositoy.getPostbyId(id);
    ResponseData<CommunityResponse> response = ResponseData.fromJson(apiResponse.data, (json) => CommunityResponse.fromJson(json as Map<String, dynamic>));
    idInfo.value = response.data;
    print(idInfo.value?.toJson());
  }

  void getPostsMy() async {
    ApiResponse apiResponse = await _repositoy.getPostsMy();
    ResponseData<List<CommunityResponse>> communityResponse = ResponseData.fromJson(apiResponse.data, (json) => (json as List).map((e) => CommunityResponse.fromJson(e)).toList());

    print(communityResponse.data);
  }
}