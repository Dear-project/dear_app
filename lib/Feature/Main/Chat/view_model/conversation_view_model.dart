import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_app/Feature/Main/Chat/ui/chat2_view.dart';
import 'package:dear_app/Shared/model/api_response.dart';
import 'package:dear_app/Shared/model/response_data.dart';
import 'package:dear_app/Shared/model/user_profile_response.dart';
import 'package:dear_app/Shared/repository/user_repository.dart';
import 'package:dear_app/Shared/service/firebase_cloud.dart';
import 'package:get/get.dart';
import 'package:dear_app/Shared/constants/constants.dart';

class ConversationViewModel extends GetxController {

  final FirebaseCloud _firebaseCloud = FirebaseCloudImpl();
  final UserRepository userRepository = UserRepositoryImpl();

  final Rxn<QuerySnapshot<Map<String, dynamic>>> _conversations =
      Rxn<QuerySnapshot<Map<String, dynamic>>>();

  Future<void> getConversations({required String email}) async {
    _firebaseCloud.getConversations(email: email).listen(
      (snapshots) {
        _conversations.value = snapshots;
      },
    );
  }

  Future<void> toChatView({required DocumentSnapshot<Map<String, dynamic>> conversation, required VoidCallback onSuccess}) async {

    await conversation.reference.update({MESSAGE_READ: true});
    ApiResponse apiResponse = await userRepository.getProfileByEmail(
        email: conversation[USER_ID]);
    if (apiResponse.statusCode == HttpStatus.ok) {
      ResponseData<UserProfileResponse> responseData = apiResponse.data;
      UserProfileResponse userProfileResponse = responseData.data;
      onSuccess();
      Get.to(() => Chat2View(revUser: userProfileResponse));
    }

  }

  get conversations => _conversations.value;

}
