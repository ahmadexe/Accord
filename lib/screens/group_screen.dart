import 'package:accord/utils/colors.dart';
import 'package:accord/widgets/users_messages.dart';
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

  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
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
              child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return UsersMessages();
                  }),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
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
                        child: IconButton(color: secondaryColor, onPressed: (){}, icon: const Icon(Icons.send, color: Colors.white,)) ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
