import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_app/Shared/component/cached_circle_avatar.dart';
import 'package:dear_app/Shared/component/my_badge.dart';
import 'package:dear_app/Shared/constants/constants.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:dear_app/shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatListItem extends StatelessWidget {

  final DocumentSnapshot<Map<String, dynamic>> conversation;
  final Function({required DocumentSnapshot<Map<String, dynamic>> conversation}) onTap;

  ChatListItem({ required this.conversation, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ko', timeago.KoMessages());
    return Column(
      children: [
        ListTile(
          leading: (conversation[USER_PROFILE_PHOTO] == "")
              ? CircleAvatar(radius: 40, child: DearIcons.my)
              : CachedCicleAvatar(conversation[USER_PROFILE_PHOTO]),
          title: Text(
              conversation[USER_FULLNAME].split(" ")[0],
              style: const TextStyle(fontSize: 18)),
          subtitle: conversation[MESSAGE_TYPE] == 'text'
              ? Text("${conversation[LAST_MESSAGE]}\n"
              "${timeago.format(conversation[TIMESTAMP].toDate(), locale: 'ko')}")
              : Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.photo_camera,
                  color: Theme
                      .of(context)
                      .primaryColor),
              const SizedBox(width: 5),
              Text('사진'),
            ],
          ),
          trailing: !conversation[MESSAGE_READ]
              ? Container(
              width: 30,
              height: 30,
              child: MyBadge(
                text: '1',
              ))
              : null,
          onTap: () => onTap(conversation: conversation),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            color: DearColors.main.withOpacity(0.3),
          ),
        )
      ],
    );
  }
}
