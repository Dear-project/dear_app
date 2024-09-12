  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_app/Shared/constants/constants.dart';

abstract class FirebaseCloud {
  Stream<QuerySnapshot<Map<String, dynamic>>> getConversations({required String email});
}

class FirebaseCloudImpl implements FirebaseCloud {
  final _firestore = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getConversations({required String email}) {
    return _firestore
        .collection(C_CONNECTIONS)
        .doc(email)
        .collection(C_CONVERSATIONS)
        .orderBy(TIMESTAMP, descending: true)
        .snapshots();
  }

}