import 'dart:io';

import 'package:dear_app/Feature/Auth/School/model/school_info.dart';
import 'package:dear_app/Feature/Auth/School/model/search_school_request.dart';
import 'package:dear_app/Feature/Auth/School/model/search_school_response.dart';
import 'package:dear_app/Feature/Auth/School/repository/school_repository.dart';
import 'package:dear_app/Feature/Main/Discover/model/bookmark_response.dart';
import 'package:dear_app/Feature/Main/Discover/model/discover_request.dart';
import 'package:dear_app/Feature/Main/Discover/model/discover_response.dart';
import 'package:dear_app/Feature/Main/Discover/model/matching_request.dart';
import 'package:dear_app/Feature/Main/Discover/model/matching_response.dart';
import 'package:dear_app/Feature/Main/Discover/repository/discover_repository.dart';
import 'package:dear_app/Shared/enums/school_type.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DiscoverViewModel extends GetxController {
  final DiscoverRepository _repository = DiscoverRepositoryImpl();

  final SchoolRepository _schoolRepository = SchoolRepositoryImpl();


  final PagingController<int, DiscoverResponse> pagingController = PagingController(firstPageKey: 1);
  final PagingController<int, MatchingResponse> matchingPC = PagingController(firstPageKey: 1);


  Rxn<List<SchoolInfo>> univeristyList = Rxn<List<SchoolInfo>>([]);
  Rxn<List<DiscoverResponse>> suggestProfessorList = Rxn<List<DiscoverResponse>>([]);
  Rxn<List<MatchingResponse>> recentMatchingList = Rxn<List<MatchingResponse>>([]);

  Future<void> getProfessor(int pageKey) async {
    ApiResponse response =
        await _repository.getProfessor(discoverRequest: DiscoverRequest(page: pageKey, size: 10));

    print([response.statusCode, response.errorMessage, response.data]);

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<DiscoverResponse>> responseData = ResponseData.fromJson(
          response.data,
          (json) =>
              (json as List).map((e) => DiscoverResponse.fromJson(e)).toList());

      if (responseData.data.length < 10) {
        pagingController.appendLastPage(responseData.data);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(responseData.data, nextPageKey);
      }
    }
  }

  void sendMatchingRequest(MatchingRequest? matchingRequest) async {
    ApiResponse response =
        await _repository.sendMatchingRequest(matchingRequest: matchingRequest);

    if (response.statusCode == HttpStatus.ok) {
      Utils.toastMessage("교수님께 매칭을 요청하였습니다.");
      Get.back();
    } else if(response.statusCode == HttpStatus.conflict) {
      Utils.toastMessage("이미 요청한 교수님입니다");
    } else {
      print(response.statusCode,);
      Utils.toastMessage("오류가 발생하였습니다");
    }
  }

  void getMatchingRequest(int pageKey) async {
    ApiResponse response = await _repository.getMatchingRequest(discoverRequest: DiscoverRequest(page: pageKey, size: 10));

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<MatchingResponse>> responseData = ResponseData.fromJson(
          response.data,
              (json) => (json as List).map((e) => MatchingResponse.fromJson(e)).toList());

      print(responseData.data);
      if (responseData.data.length < 10) {
        matchingPC.appendLastPage(responseData.data);
      } else {
        final nextPageKey = pageKey + 1;
        matchingPC.appendPage(responseData.data, nextPageKey);
      }
    }
  }

  void getMatchingRecent() async {
    ApiResponse response = await _repository.getMatchingRequest(discoverRequest: DiscoverRequest(page: 1, size: 2));

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<MatchingResponse>> responseData = ResponseData.fromJson(
          response.data,
              (json) => (json as List).map((e) => MatchingResponse.fromJson(e)).toList());

      recentMatchingList.value = responseData.data;
    }
  }

  void getUniversity() async {
    ApiResponse response = await _schoolRepository.search(
        searchSchoolRequest:
            SearchSchoolRequest(gubunType: SchoolType.UNIV.key, keyword: ""));

    SearchSchoolResponse searchSchoolResponse =
        response.data as SearchSchoolResponse;

    univeristyList.value = searchSchoolResponse.data;
  }

  void getSuggestProfessor() async {
    ApiResponse response = await _repository.getProfessor(
      discoverRequest: DiscoverRequest(page: 1, size: 3)
    );

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<DiscoverResponse>> responseData = ResponseData.fromJson(
          response.data,
              (json) =>
              (json as List).map((e) => DiscoverResponse.fromJson(e)).toList());

      suggestProfessorList.value = responseData.data;
    }
  }

  void getBookmark() async {
    ApiResponse response = await _repository.getProfessor(
        discoverRequest: DiscoverRequest(page: 1, size: 10)
    );

    print(response.statusCode);

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<List<BookmarkResponse>> data = ResponseData.fromJson(
          response.data,
            (json) =>
            (json as List).map((e) => BookmarkResponse.fromJson(e)).toList()
      );

      print(data);
    }
  }

  void rejectMatchingRequest(MatchingRequest matchingRequest) async {
    ApiResponse response =
    await _repository.rejectMatchingRequest(matchingRequest: matchingRequest!);

    if (response.statusCode == HttpStatus.ok) {
      Utils.toastMessage("요청을 거절하였습니다");
      matchingPC.refresh();
    } else {
      Utils.toastMessage("오류가 발생하였습니다");
    }
  }

  void acceptMatchingRequest(MatchingRequest matchingRequest) async {
    ApiResponse response =
    await _repository.acceptMatchingRequest(matchingRequest: matchingRequest!);

    if (response.statusCode == HttpStatus.ok) {
      Utils.toastMessage("요청을 수락하였습니다.");
      matchingPC.refresh();
    } else {
      Utils.toastMessage("오류가 발생하였습니다");
    }
  }

}
