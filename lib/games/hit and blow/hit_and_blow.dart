import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.black,
  Colors.white,
];

List<Color> solution = [
  colors[Random().nextInt(colors.length)],
  colors[Random().nextInt(colors.length)],
  colors[Random().nextInt(colors.length)],
  colors[Random().nextInt(colors.length)],
];

class HitAndBlowScreen extends StatefulWidget {
  const HitAndBlowScreen({super.key});

  @override
  State<HitAndBlowScreen> createState() => _HitAndBlowScreenState();
}

class _HitAndBlowScreenState extends State<HitAndBlowScreen> {
  List<List<Color>> previousGuesses = [];
  bool gameOver = false;

  bool checkCode(List<Color> guess) {
    if (listEquals(guess, solution)) {
      return true;
    }
    return false;
  }

  int rowIndex = 1;
  int guessIndex = 1;
  Color guessColor = Colors.grey;
  var isSelected = false;

  Widget guessingContainer(int index) {
    int spotIndex = index;

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: isSelected ? guessColor : Colors.grey,
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: Colors.black,
          )
      ),
    );
  }

  Widget guessingArea(int index) {
    int rowIndex = index;

    return Row(
      children: [
        const SizedBox(width: 10),
        guessingContainer(1),
        const SizedBox(width: 10),
        guessingContainer(2),
        const SizedBox(width: 10),
        guessingContainer(3),
        const SizedBox(width: 10),
        guessingContainer(4),
        const SizedBox(width: 10),
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  )
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  )
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  )
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "Guess the pattern.",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              const SizedBox(height: 30),
              guessingArea(1),
              const SizedBox(height: 20),
              guessingArea(2),
              const SizedBox(height: 20),
              guessingArea(3),
              const SizedBox(height: 20),
              guessingArea(4),
              const SizedBox(height: 20),
              guessingArea(5),
              const SizedBox(height: 20),
              guessingArea(6),
              const SizedBox(height: 20),
              guessingArea(7),
              const SizedBox(height: 20),
              guessingArea(8),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                        guessColor = colors[0];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[0],
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: null,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                        guessColor = colors[1];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[1],
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: null,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                        guessColor = colors[2];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[2],
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: null,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                        guessColor = colors[3];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[3],
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: null,
                  ),
                ),
                const SizedBox(width: 30),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                    ),
                    child: const Text("Undo"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                        guessColor = colors[4];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[4],
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: null,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                        guessColor = colors[5];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[5],
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: null,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                        guessColor = colors[6];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[6],
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: null,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSelected = true;
                        guessColor = colors[7];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[7],
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: null,
                  ),
                ),
                const SizedBox(width: 30),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      side: const BorderSide(
                          width: 1,
                          color: Colors.black
                      ),
                      elevation: 10,
                    ),
                    child: const Text("Guess"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}