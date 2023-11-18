import 'package:flutter/material.dart';
import 'home.dart';

class HitAndBlowScreen extends StatelessWidget {
  const HitAndBlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
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