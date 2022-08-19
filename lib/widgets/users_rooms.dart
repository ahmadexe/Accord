import 'package:accord/utils/colors.dart';
import 'package:flutter/material.dart';

class UsersRooms extends StatelessWidget {
  const UsersRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: const BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              spreadRadius: 0.0,
              offset: Offset(0.5, 0.5),
            )
          ]),
      child: Row(
        children: [
          SizedBox(width: 10,),
          CircleAvatar(
            radius: 30,
            backgroundColor: primaryColor,
            child: Center(
              child: Text('A', style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
