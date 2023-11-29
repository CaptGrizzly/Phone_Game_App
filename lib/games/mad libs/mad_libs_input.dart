import 'package:flutter/material.dart';
import '../../home.dart';

class MadLibsInputScreen extends StatefulWidget {
  const MadLibsInputScreen({super.key});

  @override
  State<MadLibsInputScreen> createState() => _MadLibsInputScreenState();
}

class _MadLibsInputScreenState extends State<MadLibsInputScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'Let\'s fill out the puzzle.',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 100, 3, 3),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Noun',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 100, 3, 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}