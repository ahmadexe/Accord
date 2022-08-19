import 'package:accord/screens/login_screen.dart';
import 'package:accord/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: () async {await Authentication().signOut();Get.off(LoginScreen());}, child: Text('Logout'))
        ),
      ),
    );
  }
}
