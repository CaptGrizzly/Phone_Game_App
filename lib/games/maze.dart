import 'package:flutter/material.dart';
import '../home.dart';

class MazeScreen extends StatelessWidget {
  const MazeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GameHomeScreen())
            );
          },
          child: const Text('Home'),
        ),
      ),
    );
  }
}