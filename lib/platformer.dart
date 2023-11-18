import 'package:flutter/material.dart';
import 'home.dart';

class PlatformerScreen extends StatelessWidget {
  const PlatformerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
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