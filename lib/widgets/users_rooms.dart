import 'package:accord/utils/colors.dart';
import 'package:flutter/material.dart';

class UsersRooms extends StatelessWidget {
  final snap;
  const UsersRooms({required this.snap, super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
            height: 100,
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
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: primaryColor,
                    child: Center(
                      child: Text(
                        snap['groupName'].toString()[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snap['groupName'].toString(),
                              style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Text(snap['description'].toString(), overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: false,),
                            )
                          ],
                      ),
                  )
                ],
              ),
          ),
          const SizedBox(height: 15,)
      ],
    );
  }
}
