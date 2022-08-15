import 'package:accord/utils/colors.dart';
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
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  cursorColor: primaryColor,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    labelStyle: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  cursorColor: primaryColor,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    labelStyle: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                  height: 40,
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor)),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ))),
              const SizedBox(height: 8),
              GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Sign up!",
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
