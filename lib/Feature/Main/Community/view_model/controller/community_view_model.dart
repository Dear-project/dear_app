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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommunityViewModel extends GetxController {
  final CommunityRepository _repositoy = CommunityRepositoryImpl();
  final CommentRepository _commentRepository = CommentRepositoryImpl();

  final PagingController<int, CommunityResponse> pagingController =
      PagingController(firstPageKey: 1);

  Rxn<List<CommunityResponse>> myCommunityList =
      Rxn<List<CommunityResponse>>([]);

  Rxn<List<CommentResponse>> commentList = Rxn<List<CommentResponse>>([]);

  Rxn<CommunityResponse> infoById = Rxn<CommunityResponse>();

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  void initPagingController() {

  }

  void initTextController() {
    titleController.text = "";
    contentController.text = "";
  }

  Future<void> getPosts(int pageKey) async {
    ApiResponse apiResponse = await _repositoy.getPosts(pageKey);

    if (apiResponse.statusCode == HttpStatus.ok) {
      ResponseData<List<CommunityResponse>> communityResponse =
          ResponseData.fromJson(
              apiResponse.data,
              (json) => (json as List)
                  .map((e) => CommunityResponse.fromJson(e))
                  .toList());

      if (communityResponse.data.length < 10) {
        pagingController.appendLastPage(communityResponse.data);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(communityResponse.data, nextPageKey);
      }
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
      pagingController.refresh();
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
    ResponseData<List<CommentResponse>> commentResponse = ResponseData.fromJson(
        apiResponse.data,
        (json) =>
            (json as List).map((e) => CommentResponse.fromJson(e)).toList());

    commentList.value = commentResponse.data;
  }

  void postComment(int id) async {
    if (commentController.text.trim() != "") {
      _commentRepository
          .postComment(CommentRequest(content: commentController.text, id: id))
          .then((value) {
        getComments(id);
        commentController.text = "";
      });
    }
  }
}
