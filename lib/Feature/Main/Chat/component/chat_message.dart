import 'package:dear_app/Shared/component/cached_circle_avatar.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  // Variables
  final bool isUserSender;
  final String? userPhotoLink;
  final bool isImage;
  final String? imageLink;
  final String? textMessage;
  final String timeAgo;

  const ChatMessage(
      {Key? key,
      required this.isUserSender,
      this.userPhotoLink,
      required this.timeAgo,
      this.isImage = false,
      this.imageLink,
      this.textMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfilePhoto = (userPhotoLink == null || userPhotoLink == "")
        ? CircleAvatar(radius: 20, child: DearIcons.my)
        : CachedCicleAvatar(
            userPhotoLink!,
            radius: 20,
          );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          !isUserSender
              ? userProfilePhoto
              : const SizedBox(width: 0, height: 0),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: isUserSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: !isUserSender
                          ? Colors.grey.withAlpha(50)
                          : Theme.of(context).primaryColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(25)),
                  child: isImage
                      ? GestureDetector(
                          onTap: () {
                            // Show full image
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    _ShowFullImage(imageLink!)));
                          },
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: const EdgeInsets.all(0),
                            color: Colors.grey.withAlpha(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                                width: 200,
                                height: 200,
                                child: Hero(
                                    tag: imageLink!,
                                    child: Image.network(imageLink!))),
                          ),
                        )
                      : Text(
                          textMessage ?? "",
                          style: TextStyle(
                              fontSize: 18,
                              color:
                                  isUserSender ? Colors.black : Colors.black),
                          textAlign: TextAlign.center,
                        ),
                ),
                const SizedBox(height: 5),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      timeAgo,
                      style: const TextStyle(fontSize: 13),
                    )),
              ],
            ),
          ),
          const SizedBox(width: 10),

          /// Current User photo right
          isUserSender ? userProfilePhoto : const SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }
}

// Show chat image on full screen
class _ShowFullImage extends StatelessWidget {
  // Param
  final String imageUrl;

  const _ShowFullImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl),
          ),
        ),
      ),
    );
  }
}
