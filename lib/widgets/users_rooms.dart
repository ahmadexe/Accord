import 'package:accord/utils/colors.dart';
import 'package:flutter/material.dart';

class UsersRooms extends StatelessWidget {
  const UsersRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
        child: Expanded(
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                radius: 30,
                backgroundColor: primaryColor,
                child: Center(
                  child: Text(
                    'A',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text('This is description ppppppppppppppppppppppppppppppppppppppppppppppp', overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,),
                        )
                      ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}
