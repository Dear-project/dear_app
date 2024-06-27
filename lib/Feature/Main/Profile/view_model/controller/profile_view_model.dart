import 'dart:io';

import 'package:dear_app/Feature/Auth/Onboarding/ui/onboarding_view.dart';
import 'package:dear_app/Feature/Main/Profile/repository/profile_repository.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends GetxController {
  final storageService = Get.find<SecureStorageService>();
  final ProfileRepository _repository = ProfileRepositoryImpl();
  final imagePicker = ImagePicker();
  Rxn<UserProfileResponse> model = Rxn<UserProfileResponse>();

  Rxn<File> file = Rxn<File>();

  void signOut() {
    storageService.clearAllTokens();
    Get.delete<ProfileViewModel>();
    Get.offAll(() => OnboardingView());
  }

  void getProfile() async {
    ApiResponse response = await _repository.getProfile();

    if (response.statusCode == HttpStatus.ok) {
      ResponseData<UserProfileResponse> profileResponse = ResponseData.fromJson(response.data, (json) => UserProfileResponse.fromJson(json as Map<String, dynamic>));
      print(profileResponse.data);
      model.value = profileResponse.data;
    }

  }

  void setProfileImage() async {
    File? file;
    await selectImage()
        .then((value) => file = value)
        .onError((error, stackTrace) => file = null);

    this.file.value = file;
    
    ApiResponse response = await _repository.setProfileImage(file ?? File(""));

    if (response.statusCode == HttpStatus.ok) {
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