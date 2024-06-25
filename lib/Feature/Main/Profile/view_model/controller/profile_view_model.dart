import 'dart:io';

import 'package:dear_app/Feature/Auth/Onboarding/ui/onboarding_view.dart';
import 'package:dear_app/Feature/Main/Profile/model/profile_info.dart';
import 'package:dear_app/Feature/Main/Profile/model/profile_response.dart';
import 'package:dear_app/Feature/Main/Profile/repository/profile_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends GetxController {
  final storageService = Get.find<SecureStorageService>();
  final ProfileRepository _repository = ProfileRepositoryImpl();
  final imagePicker = ImagePicker();
  Rxn<ProfileInfo> model = Rxn<ProfileInfo>();

  Rxn<File> file = Rxn<File>();

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

  void setProfileImage() async {
    File? file;
    await selectImage()
        .then((value) => file = value)
        .onError((error, stackTrace) => file = null);

    this.file.value = file;
    
    ApiResponse response = await _repository.setProfileImage(file ?? File(""));

    if (response.statusCode == 200) {
      getProfile();
    }
  }

  Future<File?> selectImage() async {
    try {
      final XFile? image = await imagePicker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 200,
          maxWidth: 200
      );

      if (image != null) {
        return File(image.path);
      }
    } catch(e) {
      print(e);
    }
    return null;
  }


}