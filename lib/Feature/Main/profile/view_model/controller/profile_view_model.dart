import 'package:dear_app/Feature/Auth/Onboarding/ui/onboarding_view.dart';
import 'package:dear_app/Feature/Main/Profile/model/profile_info.dart';
import 'package:dear_app/Feature/Main/Profile/model/profile_response.dart';
import 'package:dear_app/Feature/Main/Profile/repository/profile_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  final storageService = Get.find<SecureStorageService>();
  final ProfileRepository _repository = ProfileRepositoryImpl();
  Rxn<ProfileInfo> model = Rxn<ProfileInfo>();

  void signOut() {
    storageService.clearAllTokens();
    Get.delete<ProfileViewModel>();
    Get.offAll(() => OnboardingView());

  }

  void getProfile() async {
    ApiResponse response = await _repository.getProfile();

    ProfileResponse profileResponse = ProfileResponse.fromJson(response.data);
    model.value = profileResponse.data;
    // 테스트
    print(model.value!.name);
    print(model.value!.imgPath);

  }


}