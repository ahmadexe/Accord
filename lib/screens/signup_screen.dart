import 'package:accord/models/user.dart';
import 'package:accord/screens/login_screen.dart';
import 'package:accord/services/authentication.dart';
import 'package:accord/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String username = "";
    String email = "";
    String password = "";

    late TextEditingController _usernameController;
    late TextEditingController _emailController;
    late TextEditingController _passwordController;
  
  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _signup(UserModel user) async {
      String result = await Authentication().signup(user);
      if (result == 'success') {
        Get.snackbar('Success!', 'You have successfully signed up.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            margin: const EdgeInsets.all(10),
            borderColor: Colors.green,
            colorText: Colors.white,
            borderWidth: 2,
            duration: const Duration(seconds: 2));
            Get.off(const LoginScreen());
      } else {
        Get.snackbar('Error', result,
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            margin: const EdgeInsets.all(10),
            borderColor: Colors.green,
            colorText: Colors.white,
            borderWidth: 2,
            duration: const Duration(seconds: 2));
      }
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/signupAccord.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _usernameController,
                  scrollPadding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(context).viewInsets.bottom + 16 * 4),
                  cursorColor: primaryColor,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
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
                  controller: _emailController,
                  scrollPadding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(context).viewInsets.bottom + 16 * 4),
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
                  controller: _passwordController,
                  scrollPadding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(context).viewInsets.bottom + 16 * 4),
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
                  onPressed: () async {
                    UserModel user = UserModel(
                        name: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text);
                    await _signup(user);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor),
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: primaryColor),
                    ),
                    Text(
                      ' Login',
                      style: TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
