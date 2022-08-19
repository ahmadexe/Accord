import 'package:accord/screens/home_screen.dart';
import 'package:accord/screens/signup_screen.dart';
import 'package:accord/services/authentication.dart';
import 'package:accord/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  String email = '';
  String password = '';
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  _login(String email, String password) async {
    String result = await Authentication().login(email, password);
    if (result == 'success') {
      Get.snackbar('Success!', 'You have successfully logged in.',
          snackPosition: SnackPosition.TOP,
          icon: const Icon(Icons.check_circle, color: Colors.green),
          backgroundColor: Colors.green,
          margin: const EdgeInsets.all(10),
          borderColor: Colors.green,
          colorText: Colors.white,
          borderWidth: 2,
          duration: const Duration(seconds: 2));
      Get.off(const HomeScreen());
    } else {
      Get.snackbar('Error', result,
          snackPosition: SnackPosition.TOP,
          icon: const Icon(Icons.error),
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(10),
          borderColor: Colors.red,
          colorText: Colors.white,
          borderWidth: 2,
          duration: const Duration(seconds: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
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
                    controller: _emailController,
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
                    height: 45,
                    width: 90,
                    child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          await _login(
                              _emailController.text, _passwordController.text);
                          setState(() {
                            _isLoading = false;
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(primaryColor)),
                        child: !_isLoading
                            ? const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              ))),
                const SizedBox(height: 8),
                GestureDetector(
                    onTap: () {
                      Get.to(SignupScreen());
                    },
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
            ),
          )),
    );
  }
}
