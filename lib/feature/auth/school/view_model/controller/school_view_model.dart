import 'dart:io';

import 'package:dear_app/Feature/Auth/School/model/major_info.dart';
import 'package:dear_app/Feature/Auth/School/model/register_major_request.dart';
import 'package:dear_app/Feature/Auth/School/model/register_school_request.dart';
import 'package:dear_app/Feature/Auth/School/model/school_info.dart';
import 'package:dear_app/Feature/Auth/School/model/search_major_response.dart';
import 'package:dear_app/Feature/Auth/School/model/search_school_request.dart';
import 'package:dear_app/Feature/Auth/School/model/search_school_response.dart';
import 'package:dear_app/Feature/Auth/School/repository/school_repository.dart';
import 'package:dear_app/Feature/Auth/School/ui/select_department_interest_view.dart';
import 'package:dear_app/Feature/Main/Navigation/ui/main_view.dart';
import 'package:dear_app/Shared/enums/school_type.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:dear_app/Shared/repository/user_repository.dart';
import 'package:dear_app/Shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolViewModel extends GetxController {
  final SchoolRepository _repository = SchoolRepositoryImpl();
  final UserRepository _userRepository = UserRepositoryImpl();
  Rxn<SchoolType> schoolType = Rxn<SchoolType>();

  RxList<SchoolInfo> schoolInfoList = RxList<SchoolInfo>();
  RxList<MajorInfo> majorInfoList = RxList<MajorInfo>();

  RxInt selectedSchoolInfoIndex = RxInt(-1);
  RxInt selectedMajorlInfoIndex = RxInt(-1);

  RxString selectedMajorSubject = RxString("");

  final searchKeywordController = TextEditingController().obs;
  final searchMajorSubjectController = TextEditingController().obs;

  void searchSchool({required String keyword}) async {
    if (schoolType.value == null) {
      Utils.snackBar('알림', '학교구분을 선택해 주세요.');
      return;
    }
    if (keyword.trim().isEmpty) {
      Utils.snackBar('알림', '검색어를 입력해 주세요.');
      return;
    }

    ApiResponse response = await _repository.search(
        searchSchoolRequest: SearchSchoolRequest(
            gubunType: schoolType.value!.key, keyword: keyword));

    SearchSchoolResponse searchSchoolResponse =
        response.data as SearchSchoolResponse;

    selectedSchoolInfoIndex.value = -1;
    schoolInfoList.value = searchSchoolResponse.data;
  }

  void searchMajorSubject({required String keyword}) async {
    if (keyword.trim().isEmpty) {
      Utils.snackBar('알림', '검색어를 입력해 주세요.');
      return;
    }
    // 전공 검색 시 계열 param 없음 , api 요청해야됨
    ApiResponse response = await _repository.searchMajor(
        searchSchoolRequest: SearchSchoolRequest(
            gubunType: SchoolType.UNIV.key, keyword: keyword));
    SearchMajorResponse searchMajorResponse = response.data;
    selectedMajorlInfoIndex.value = -1;
    majorInfoList.value = searchMajorResponse.data as List<MajorInfo>;
  }

  void register() async {
    if (selectedSchoolInfoIndex.value == -1) {
      Utils.snackBar('알림', '학교를 선택해 주세요.');
      return;
    }

    SchoolInfo info = schoolInfoList[selectedSchoolInfoIndex.value];

    ApiResponse response = await _repository.registerSchool(
        registerSchoolRequest:
            RegisterSchoolRequest(seq: info.seq, schoolName: info.schoolName));

    if (response.statusCode == HttpStatus.created) {
      Get.to(() => SelectDepartmentInterestView());
    }
  }

  void registerMajor() async {
    if (selectedMajorlInfoIndex.value == -1) {
      Utils.snackBar('알림', '전공을 선택해 주세요.');
      return;
    }

    MajorInfo info = majorInfoList[selectedMajorlInfoIndex.value];

    print(info.toJson());

    ApiResponse response = await _repository.registerMajor(
        registerMajorRequest: RegisterMajorRequest(majorSeq: info.majorSeq, lClass: info.lClass, mClass: info.mClass));

    print([response.statusCode, response.data]);
    if (response.statusCode == HttpStatus.created) {
      Get.delete<SchoolViewModel>();
      Get.offAll(() => MainView());
    }
  }
}
