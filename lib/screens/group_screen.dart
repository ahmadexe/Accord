import 'package:accord/global/user_state.dart';
import 'package:accord/services/cloud_database.dart';
import 'package:accord/utils/colors.dart';
import 'package:accord/widgets/groups_messages.dart';
import 'package:accord/widgets/users_messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GroupScreen extends StatefulWidget {
  final snap;
  const GroupScreen({required this.snap, super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  late TextEditingController _messageController;
  late String username;
  @override
  void initState() {
    _messageController = TextEditingController();
    getData();
    super.initState();
  }

  getData() async {
    username = await UserState.getUsersName();
  }

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
        title: Text(
          widget.snap['groupName'],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.80,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('groups')
                        .doc(widget.snap['groupid'])
                        .collection('messages')
                        .orderBy('timestamp', descending: true)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data!.docs[index]['senderId'] ==
                                FirebaseAuth.instance.currentUser!.uid) {
                              return UsersMessages(snap:snapshot.data!.docs[index]);
                            } else {
                              return GroupMessages(snap:snapshot.data!.docs[index]);
                            }
                          });
                    })),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: _messageController,
                        cursorColor: secondaryColor,
                        decoration: const InputDecoration(
                          hintText: "Send a message",
                          labelText: 'Message',
                          labelStyle: TextStyle(color: secondaryColor),
                          isDense: true, // important line
                          contentPadding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      )),
                ),
                CircleAvatar(
                    backgroundColor: secondaryColor,
                    child: Center(
                        child: IconButton(
                            color: secondaryColor,
                            onPressed: () async {
                              await CloudDatabase().sendMessage(
                                  _messageController.text,
                                  username,
                                  FirebaseAuth.instance.currentUser!.uid,
                                  widget.snap['groupid']);
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ))))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
