
import 'package:dear_app/Shared/model/user_model.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  static UserController get to => Get.find();

  Rx<UserModel> user = UserModel().obs;

  void updateUser(UserProfileResponse userProfile) {
    user.update((user) {
      if (user != null) {
        user.id = userProfile.id;
        user.email = userProfile.email;
        user.name = userProfile.name;
        user.schoolName = userProfile.schoolName ?? "";
        user.lClass = userProfile.lClass ?? "";
        user.mClass = userProfile.mClass ?? "";
        user.introduce = userProfile.introduce ?? "";
        user.imgPath = userProfile.imgPath ?? "";
        user.stsMessage = userProfile.stsMessage ?? "";
      }
    });
  }

}