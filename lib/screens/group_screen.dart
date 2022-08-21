import 'package:flutter/material.dart';

class GroupScreen extends StatefulWidget {
  final snap;
  const GroupScreen({required this.snap, super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.snap['publicid']),
      ),
    );
  }
}