import 'package:accord/utils/colors.dart';
import 'package:flutter/material.dart';

class UsersMessages extends StatelessWidget {
  // final snap;
  const UsersMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 0,
        right: 24
      ),
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Text('This is Message', style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}