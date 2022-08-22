import 'package:accord/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InfoScreen extends StatefulWidget {
  final snap;
  const InfoScreen({required this.snap, super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
        title: Text(widget.snap['groupName']),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: 300,
                child: Image.asset('assets/images/infoScreenHeader.png'),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(widget.snap['groupName'],
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 2,
              ),
              Text(widget.snap['description'],
                  style: const TextStyle(color: primaryColor, fontSize: 18)),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Group ID: ",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text(widget.snap['publicid'],
                      style:
                          const TextStyle(color: primaryColor, fontSize: 16)),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Admin: ",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text(widget.snap['adminName'],
                      style:
                          const TextStyle(color: primaryColor, fontSize: 16)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
              ),
              CircleAvatar(
                  radius: 30,
                  backgroundColor: primaryColor,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ))),
              const SizedBox(height: 2,),
              const Text('Invite to group', style: TextStyle(fontSize: 16),)
            ],
          ),
        ),
      ),
    );
  }
}
