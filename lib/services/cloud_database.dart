import 'package:accord/global/random_id_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class CloudDatabase {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createGroup(String name, String description, String type) async {
    try {
      String msg = 'success';
      String groupId = const Uuid().v1();
      String adminId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot adminDocument =
          await _firestore.collection('users').doc(adminId).get();
      String adminName = (adminDocument.data() as dynamic)['name'];
      String publicId = RandomUserDefine.getRandomString(8);
      await _firestore.collection('groups').doc(groupId).set({
        'groupid': groupId,
        'groupName': name,
        'description': description,
        'adminid': adminId,
        'adminName': adminName,
        'type': type,
        'members': [adminId],
        'messages': [],
        'publicid': publicId,
      });

      await _firestore.collection('users').doc(adminId).update({
        'groups': FieldValue.arrayUnion([groupId])
      });

      return msg;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  sendMessage(String body, String senderName, String senderId, String groupId) async {
    try {
      final String messageId = const Uuid().v1();
      await _firestore.collection('groups').doc(groupId).collection('messages').doc(messageId).set({
        'senderName': senderName,
        'senderId': senderId,
        'groupId': groupId,
        'message': body,
        'messageId': messageId,
        'timestamp': DateTime.now().microsecondsSinceEpoch,
      });
    } catch(e) {
      print(e.toString());
    }
  }
}
