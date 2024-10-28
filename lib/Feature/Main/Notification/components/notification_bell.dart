import 'package:dear_app/Feature/Main/Notification/ui/notification_view.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NotificationBell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: DearIcons.bell.toIcon(),
        onPressed: () {
          Get.to(() => NotificationView());
        }
    );
  }

}