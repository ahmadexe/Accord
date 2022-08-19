import 'package:accord/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Create a Room'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                width: 300,
                child: Image.asset('assets/images/createGroup.png'),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    cursorColor: secondaryColor,
                    decoration: const InputDecoration(
                      hintText: "Enter name of the group.",
                      labelText: 'Name of the Group',
                      labelStyle: TextStyle(color: secondaryColor),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                    ],
                    cursorColor: secondaryColor,
                    decoration: const InputDecoration(
                      hintText: "Enter a description.",
                      labelText: 'Description',
                      labelStyle: TextStyle(color: secondaryColor),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 45,
                  width: 90,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Create!"),
                      style: 
                      ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(primaryColor)
                      )
                      ,))
            ],
          ),
        ),
      ),
    );
  }
}
