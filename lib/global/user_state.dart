import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserState {
  static Future<String> getUsersName() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    return doc['name'];
  }
}