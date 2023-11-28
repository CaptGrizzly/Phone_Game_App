import 'package:flutter/material.dart';
import '../home.dart';

class MadLibsHomeScreen extends StatelessWidget {
  const MadLibsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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