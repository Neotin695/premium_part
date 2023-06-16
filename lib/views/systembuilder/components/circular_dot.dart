import 'package:flutter/material.dart';

class CircularDot extends StatelessWidget {
  const CircularDot({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 10,
    );
  }
}
