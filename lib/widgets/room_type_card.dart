import 'package:flutter/material.dart';

class RoomTypeCard extends StatelessWidget {
  final String text;
  final String imgAddress;
  final Function function;
  const RoomTypeCard({required this.text, required this.imgAddress, required this.function,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            spreadRadius: 0.0,
            offset: Offset(1, 1), // shadow direction: bottom right
          )
        ],
      ),
      height: 170,
      width: 220,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            spreadRadius: 0.0,
            offset: Offset(1, 1), // shadow direction: bottom right
          )
        ],
                  image: DecorationImage(
                      image: NetworkImage(imgAddress), fit: BoxFit.fill)),
              height: 130,
              width: 220,
            ),
          )
        ],
      ),
    );
  }
}
