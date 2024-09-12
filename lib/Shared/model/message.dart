import 'dart:io';

enum MessageType {
  TEXT("text"),
  IMAGE("image");

  final String key;

  const MessageType(this.key);
}

class Message {
  String type;
  String? textMsg;
  File? imgFile;

  String senderUserID;
  String senderUserName;
  String senderUserProfile;

  String receiverUserID;
  String receiverUserName;
  String receiverUserProfile;

  Message(
      {required this.type,
      required this.textMsg,
      required this.imgFile,
      required this.senderUserID,
      required this.senderUserName,
      required this.senderUserProfile,
      required this.receiverUserID,
      required this.receiverUserName,
      required this.receiverUserProfile});
}
