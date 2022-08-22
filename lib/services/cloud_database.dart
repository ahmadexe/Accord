import 'package:accord/global/random_id_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class CloudDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createGroup(
      String name, String description, String type) async {
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

  sendMessage(
      String body, String senderName, String senderId, String groupId) async {
    try {
      final String messageId = const Uuid().v1();
      await _firestore
          .collection('groups')
          .doc(groupId)
          .collection('messages')
          .doc(messageId)
          .set({
        'senderName': senderName,
        'senderId': senderId,
        'groupId': groupId,
        'message': body,
        'messageId': messageId,
        'timestamp': DateTime.now().microsecondsSinceEpoch,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> searchGroup(String publicId, String userId) async {
    String response = "An error occurred while searching";
    try {
      await _firestore
          .collection('groups')
          .where('publicid', isEqualTo: publicId)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        for (var doc in querySnapshot.docs) {
          if (doc['members'].contains(userId)) {
            response = 'You are already a member of this group.';
            return response;
          } else {
            await _firestore.collection('groups').doc(doc['groupid']).update({
              'members': FieldValue.arrayUnion([userId]),
            });
            response = 'You have joined this group!';
            return response;
          }
        }
      });
      return response;
    } catch (e) {
      return response;
    }
  }
}
