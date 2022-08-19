import 'package:accord/screens/create_group.dart';
import 'package:accord/screens/login_screen.dart';
import 'package:accord/services/authentication.dart';
import 'package:accord/utils/colors.dart';
import 'package:accord/widgets/room_type_card.dart';
import 'package:accord/widgets/users_rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String techAddress = 'assets/images/tech.jpg';
  String scienceAddress = 'assets/images/space.jpg';
  String sportsAddress = 'assets/images/sports.jpg';
  String dailyAddress = 'assets/images/newspaper.jpg';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: primaryColor,
        //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.light));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            "Welcome",
            style: TextStyle(color: Colors.white),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const CircleAvatar(
                radius: 30,
                backgroundColor: backgroundColor,
                child: Text(
                  "A",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Ahmad",
                style: TextStyle(fontSize: 16),
              ),
              ListTile(
                tileColor: Colors.white,
                onTap: () {
                  Get.to(CreateGroupScreen());
                },
                leading: const Icon(
                  Icons.group_sharp,
                  color: primaryColor,
                ),
                title: const Text("Create a group."),
              ),
              ListTile(
                tileColor: Colors.white,
                onTap: () async {
                  await Authentication().signOut();
                  Get.off(const LoginScreen());
                },
                leading: const Icon(
                  Icons.logout,
                  color: primaryColor,
                ),
                title: const Text("Log out?"),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    cursorColor: secondaryColor,
                    decoration: InputDecoration(
                        hintText: "Enter group ID",
                        labelText: 'Group ID',
                        labelStyle: const TextStyle(color: secondaryColor),
                        isDense: true, // important line
                        contentPadding:
                            const EdgeInsets.fromLTRB(30, 30, 30, 0),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: secondaryColor,
                            ))),
                  )),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "What can we help you find?",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  const SizedBox(
                    width: 16,
                  ),
                  RoomTypeCard(
                    text: 'Tech',
                    imgAddress: techAddress,
                    function: () {},
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  RoomTypeCard(
                      text: 'Daily', imgAddress: dailyAddress, function: () {}),
                  const SizedBox(
                    width: 16,
                  ),
                  RoomTypeCard(
                      text: 'Science',
                      imgAddress: scienceAddress,
                      function: () {}),
                  const SizedBox(
                    width: 16,
                  ),
                  RoomTypeCard(
                      text: 'Sports',
                      imgAddress: sportsAddress,
                      function: () {}),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Your Rooms",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('groups').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: const CircularProgressIndicator(color: primaryColor,),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return UsersRooms(snap: snapshot.data!.docs[index],);
                    }
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
