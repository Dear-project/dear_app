import 'package:dear_app/Feature/Main/Chat/component/chat_cell.dart';
import 'package:dear_app/Feature/Main/Chat/view_model/chat_view_model.dart';
import 'package:dear_app/Feature/Main/Profile/ui/profile_view.dart';
import 'package:dear_app/Feature/Main/Profile/view_model/controller/profile_view_model.dart';
import 'package:dear_app/Shared/controller/user_role_controller.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AllChatView extends StatefulWidget {
  AllChatView({super.key});

  @override
  State<AllChatView> createState() => _AllChatViewState();
}

class _AllChatViewState extends State<AllChatView> {
  final _chatVM = Get.put(ChatViewModel());
  final _profileVM = Get.put(ProfileViewModel());
  final _roleController = UserRoleController.shared;

  @override
  void initState() {
    super.initState();
    _chatVM.getRooms(_profileVM.model.value?.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight - 100),
            child: Obx(() => IntrinsicHeight(
                child: _chatVM.roomList.value != null &&
                    _chatVM.roomList.value!.isNotEmpty
                    ? Column(
                  children: [
                    ...List.generate(
                        _chatVM.roomList.value!.length,
                            (index) => ChatCell(
                            model: _chatVM.roomList.value![index],
                            modAction: () {
                              _chatVM.clickedIndex = index;
                            }
                        )),
                    SizedBox(height: 100)
                  ],
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: DearImages.messagePlaceholder.image,
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      _roleController.isStudent ? "교수님에게 말을 걸어보세요" : "요청이 오기까지 기다려주세요",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Pretendard",
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ))),
          ));
    }));
  }
}
