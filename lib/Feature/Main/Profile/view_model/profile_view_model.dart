import 'package:dear_app/Feature/Main/Profile/model/profile_info.dart';
import 'package:dear_app/Feature/Main/Profile/model/profile_response.dart';
import 'package:dear_app/Feature/Main/Profile/repository/profile_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  final ProfileRepository _repository = ProfileRepositoryImpl();
  Rxn<ProfileInfo> model = Rxn<ProfileInfo>();


  void getProfile() async {
    ApiResponse response = await _repository.getProfile();

    ProfileResponse profileResponse = ProfileResponse.fromJson(response.data);
    model.value = profileResponse.data;

    // 테스트
    print(model.value!.name);
    print(model.value!.imgPath);
  }
}
