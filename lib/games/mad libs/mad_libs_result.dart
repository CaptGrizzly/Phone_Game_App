import 'package:flutter/material.dart';
import '../../home.dart';
import 'mad_libs_home.dart';

class MadLibsResultsScreen extends StatefulWidget {
  const MadLibsResultsScreen({
    super.key,
    required this.story,
    required this.input,
  });

  final String story;
  final List<String> input;
  @override
  State<MadLibsResultsScreen> createState() => _MadLibsResultsScreenState();
}

class _MadLibsResultsScreenState extends State<MadLibsResultsScreen> {

  @override
  Widget build(BuildContext context) {
    String filledStory = widget.story;
    for (var term in widget.input) {
      filledStory = filledStory.replaceFirst("word", term);
    }

    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Final Result',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 100, 3, 3),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: Text(
                    filledStory,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          side: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MadLibsHomeScreen())
                          );
                        },
                        child: const Text(
                          'New Puzzle',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          side: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const GameHomeScreen())
                          );
                        },
                        child: const Text(
                          'Home',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
    );
  }
}