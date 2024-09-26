import 'package:dear_app/Shared/enums/user_type.dart';
import 'package:get/get.dart';

class UserRoleController extends GetxController {

  static UserRoleController get shared => Get.find();

  Rx<UserType> role = Rx<UserType>(UserType.STUDENT);

  bool get isStudent => role == UserType.STUDENT;
}