import 'dart:io';

import 'package:dear_app/Feature/Main/Community/model/comment_request.dart';
import 'package:dear_app/Feature/Main/Community/model/comment_response.dart';
import 'package:dear_app/Feature/Main/Community/model/community_response.dart';
import 'package:dear_app/Feature/Main/Community/model/post_id_response.dart';
import 'package:dear_app/Feature/Main/Community/model/post_request.dart';
import 'package:dear_app/Feature/Main/Community/repository/comment_repository.dart';
import 'package:dear_app/Feature/Main/Community/repository/community_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommunityViewModel extends GetxController {
  final CommunityRepository _repositoy = CommunityRepositoryImpl();
  final CommentRepository _commentRepository = CommentRepositoryImpl();
  Rxn<List<CommunityResponse>> communityList = Rxn<List<CommunityResponse>>([]);
  Rxn<List<CommunityResponse>> myCommunityList =
      Rxn<List<CommunityResponse>>([]);

  Rxn<List<CommentResponse>> commentList = Rxn<List<CommentResponse>>([]);

  Rxn<CommunityResponse> infoById = Rxn<CommunityResponse>();

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void initTextController() {
    titleController.text = "";
    contentController.text = "";
  }

  void getPosts() async {
    ApiResponse apiResponse = await _repositoy.getPosts();

    if (apiResponse.statusCode == HttpStatus.ok) {
      ResponseData<List<CommunityResponse>> communityResponse =
          ResponseData.fromJson(
              apiResponse.data,
              (json) => (json as List)
                  .map((e) => CommunityResponse.fromJson(e))
                  .toList());

      communityList.value = communityResponse.data;
    }
  }

  void addPosts() async {
    ApiResponse apiResponse = await _repositoy.addPosts();

    if (apiResponse.statusCode == HttpStatus.ok) {
      ResponseData<PostIDResponse> dt = ResponseData.fromJson(apiResponse.data,
          (json) => PostIDResponse.fromJson(json as Map<String, dynamic>));
      patchPosts(dt.data.id);
    }
  }

  void patchPosts(int id) async {
    ApiResponse apiResponse = await _repositoy.patchPosts(
        id,
        PostRequest(
            title: titleController.text, content: contentController.text));
    print([apiResponse.statusCode, apiResponse.errorMessage]);
    if (apiResponse.statusCode == HttpStatus.ok) {
      Get.back();
      getPosts();
    }
  }

  void getPostbyId(int id) async {
    ApiResponse apiResponse = await _repositoy.getPostbyId(id);
    ResponseData<CommunityResponse> response = ResponseData.fromJson(
        apiResponse.data,
        (json) => CommunityResponse.fromJson(json as Map<String, dynamic>));
    infoById.value = response.data;
    print(infoById.value?.toJson());
  }

  void getPostsMy() async {
    ApiResponse apiResponse = await _repositoy.getPostsMy();
    ResponseData<List<CommunityResponse>> communityResponse =
        ResponseData.fromJson(
            apiResponse.data,
            (json) => (json as List)
                .map((e) => CommunityResponse.fromJson(e))
                .toList());

    myCommunityList.value = communityResponse.data;
  }

  void getComments(int id) async {
    ApiResponse apiResponse = await _commentRepository.getComments(id);
    ResponseData<List<CommentResponse>> commentResponse =
    ResponseData.fromJson(
        apiResponse.data,
            (json) => (json as List)
            .map((e) => CommentResponse.fromJson(e))
            .toList());

    commentList.value = commentResponse.data;
  }

  void postComment(int id, String content) async {
    _commentRepository.postComment(CommentRequest(content: content, id: id)).then((value) {
      print(value.data);
      getComments(id);
    });
  }
}
