import 'dart:io';

import 'package:dear_app/Feature/Auth/Onboarding/ui/onboarding_view.dart';
import 'package:dear_app/Feature/Auth/School/ui/select_school_view.dart';
import 'package:dear_app/Feature/Main/Profile/repository/profile_repository.dart';
import 'package:dear_app/Shared/controller/user_controller.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends GetxController {
  final storageService = Get.find<SecureStorageService>();
  final UserController userController = Get.find();

  final ProfileRepository _repository = ProfileRepositoryImpl();
  final imagePicker = ImagePicker();
  final imageCropper = ImageCropper();
  final TextEditingController editPWController = TextEditingController();

  Rxn<UserProfileResponse> model = Rxn<UserProfileResponse>();
  Rxn<List<String>> badgeList = Rxn<List<String>>([]);

  Rxn<File> file = Rxn<File>();

  void signOut() {
    storageService.clearAllTokens();
    Get.delete<ProfileViewModel>();
    Get.offAll(() => OnboardingView());
  }

  void getProfile() async {
    ApiResponse response = await _repository.getProfile();
    badgeList.value = [];

    print("프로필 response ${response.data}");

    if (response.statusCode == HttpStatus.ok) {

      ResponseData<UserProfileResponse> profileResponse = ResponseData.fromJson(
          response.data,
          (json) => UserProfileResponse.fromJson(json as Map<String, dynamic>));
      model.value = profileResponse.data;

      userController.updateUser(profileResponse.data);

      if (model.value?.schoolName != null) {
        badgeList.value?.add(model.value!.schoolName!);
      }
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

      if (image != null && image.path != "") {
        // final croppedFile = await imageCropper.cropImage(
        //     sourcePath: File(image.path).path,
        //     compressFormat: ImageCompressFormat.jpg,
        //     compressQuality: 100,
        //     aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        // );

        // if (croppedFile != null) {
        return File(image.path);
        // }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void deleteUser() async {
    ApiResponse response = await _repository.deleteUser();

    if (response.statusCode == HttpStatus.ok) {
      signOut();
    }
  }
}
