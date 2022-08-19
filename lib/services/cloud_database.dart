import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class CloudDatabase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createGroup(String name, String description, String type) async {
    try {
      String msg = 'success';
      String groupId = const Uuid().v1();
      String adminId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot adminDocument =
          await _firestore.collection('users').doc(adminId).get();
      String adminName = (adminDocument.data() as dynamic)['name'];

      await _firestore.collection('groups').doc(groupId).set({
        'groupid': groupId,
        'groupName': name,
        'description': description,
        'adminid': adminId,
        'adminName': adminName,
        'type': type,
        'members': [adminId],
        'messages': []
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
}
