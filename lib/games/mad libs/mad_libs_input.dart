import 'package:flutter/material.dart';
import 'mad_libs_home.dart';
import 'mad_libs_result.dart';

class MadLibsInputScreen extends StatefulWidget {
  const MadLibsInputScreen({
    super.key,
    required this.story,
    required this.blanks,
  });

  final String story;
  final List<String> blanks;

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
              for (String blank in widget.blanks) ... [
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
                const SizedBox(height: 5),
                Text(
                  blank,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 100, 3, 3),
                  ),
                ),
                const SizedBox(height: 10),
              ],
              const SizedBox(height: 10),
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    side: const BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MadLibsResultsScreen(
                          story: widget.story,
                          blanks: widget.blanks,
                        ))
                    );
                  },
                  child: const Text(
                    'See Result',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}