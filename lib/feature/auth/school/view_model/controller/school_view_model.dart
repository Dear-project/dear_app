
import 'package:dear_app/feature/auth/school/model/major_info.dart';
import 'package:dear_app/feature/auth/school/model/school_info.dart';

import 'package:dear_app/feature/auth/school/repository/school_repository.dart';
import 'package:dear_app/feature/auth/school/model/search_school_request.dart';

import 'package:dear_app/feature/auth/school/ui/select_department_interest_view.dart';
import 'package:dear_app/shared/enums/school_type.dart';
import 'package:dear_app/shared/model/api_response.dart';
import 'package:dear_app/shared/utils/utils.dart';
import 'package:dear_app/feature/auth/school/model/search_major_response.dart';
import 'package:dear_app/feature/auth/school/model/search_school_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolViewModel extends GetxController {
  final SchoolRepository _repository = SchoolRepositoryImpl();
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
        response.data;
    selectedSchoolInfoIndex.value = -1;
    schoolInfoList.value = searchSchoolResponse.data as List<SchoolInfo>;
  }

  void searchMajorSubject({required String keyword}) async {
    if (keyword.trim().isEmpty) {
      Utils.snackBar('알림', '검색어를 입력해 주세요.');
      return;
    }
 // 전공 검색 시 계열 param 없음 , api 요청해야됨
    ApiResponse response = await _repository.searchMajor(
        searchSchoolRequest: SearchSchoolRequest(
            gubunType:  SchoolType.UNIV.key, keyword: keyword));
    SearchMajorResponse searchMajorResponse =
    response.data;
    selectedMajorlInfoIndex.value = -1;
    majorInfoList.value = searchMajorResponse.data as List<MajorInfo>;
  }

  void toDepartmentView() {
    if(selectedSchoolInfoIndex.value == -1){
      Utils.snackBar('알림', '학교를 선택해 주세요.');
      return;
    }

    Get.to(() => SelectDepartmentInterestView());

  }

  void register() {
    if(selectedSchoolInfoIndex.value == -1){
      Utils.snackBar('알림', '학교를 선택해 주세요.');
      return;
    }

    Get.to(() => SelectDepartmentInterestView());

  }
}
