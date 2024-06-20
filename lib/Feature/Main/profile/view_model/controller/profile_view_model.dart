import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  final storageService = Get.find<SecureStorageService>();

  void signOut() {
    storageService.clearAllTokens();
  }


}