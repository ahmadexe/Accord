import 'package:accord/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signup(UserModel user) async {
    String msg = "Sign up failed.";
    try {
      UserCredential credentials = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (credentials.user != null) {
        user.id = credentials.user!.uid;
        await _firestore.collection('users').doc(credentials.user!.uid).set({
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'id': user.id,
        });
        return "success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The email is already in use.';
      }
    }
    return msg;
  }
}
