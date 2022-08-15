import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/loginAccord.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}