import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_app/Shared/constants/constants.dart';
import 'package:dear_app/Shared/model/message.dart';

abstract class MessageService {
  Future<void> send(
      {required String type,
      required String senderId,
      required String receiverId,
      required String fromUserId,
      required String userPhotoLink,
      required String userFullName,
      required String textMsg,
      required String? imgLink,
      required bool isRead});

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      {required String sendEmail, required String revEmail, int limit = 10});

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getMoreMessages(
      {required String sendEmail, required String revEmail, int limit = 10});

  Future<void> clear();
}

class MessageServiceImpl implements MessageService {
  final _firestore = FirebaseFirestore.instance;
  DocumentSnapshot<Map<String, dynamic>>? lastDocument;
  bool hasMore = true;

  @override
  Future<void> send(
      {required String type,
      required String senderId,
      required String receiverId,
      required String fromUserId,
      required String userPhotoLink,
      required String userFullName,
      required String textMsg,
      required String? imgLink,
      required bool isRead}) async {
    await _firestore
        .collection(C_MESSAGES)
        .doc(senderId)
        .collection(receiverId)
        .doc()
        .set(<String, dynamic>{
      USER_ID: fromUserId,
      MESSAGE_TYPE: type,
      MESSAGE_TEXT: textMsg,
      MESSAGE_IMG_LINK: imgLink,
      TIMESTAMP: FieldValue.serverTimestamp(),
    });

    await saveConversation(
        type: type,
        senderId: senderId,
        receiverId: receiverId,
        userPhotoLink: userPhotoLink,
        userFullName: userFullName,
        textMsg: textMsg,
        isRead: isRead);
  }

  Future<void> saveConversation(
      {required String type,
      required String senderId,
      required String receiverId,
      required String userPhotoLink,
      required String userFullName,
      required String textMsg,
      required bool isRead}) async {
    await _firestore
        .collection(C_CONNECTIONS)
        .doc(senderId)
        .collection(C_CONVERSATIONS)
        .doc(receiverId)
        .set(<String, dynamic>{
          USER_ID: receiverId,
          USER_PROFILE_PHOTO: userPhotoLink,
          USER_FULLNAME: userFullName,
          MESSAGE_TYPE: type,
          LAST_MESSAGE: textMsg,
          MESSAGE_READ: isRead,
          TIMESTAMP: FieldValue.serverTimestamp(),
        })
        .then((value) {})
        .catchError((e) {});
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      {required String sendEmail, required String revEmail, int limit = 20}) {
    return _firestore
        .collection(C_MESSAGES)
        .doc(sendEmail)
        .collection(revEmail)
        .orderBy(TIMESTAMP, descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        lastDocument = snapshot.docs.last;
      } else {
        lastDocument = null;
      }
      if (snapshot.docs.length < limit) {
        hasMore = false;
      }
      return snapshot;
    });
  }

  @override
  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getMoreMessages(
      {required String sendEmail,
      required String revEmail,
      int limit = 20}) async {
    var query = _firestore
        .collection(C_MESSAGES)
        .doc(sendEmail)
        .collection(revEmail)
        .orderBy(TIMESTAMP, descending: true)
        .limit(limit);
    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument!);
    }
    var snapshot = await query.get();
    if (snapshot.docs.isNotEmpty) {
      lastDocument = snapshot.docs.last;
    }
    if (snapshot.docs.length < limit) {
      hasMore = false;
    }

    return snapshot.docs;
  }

  @override
  Future<void> clear() async {
    lastDocument = null;
    hasMore = true;
  }
}
