import 'dart:math';
import 'package:flutter/material.dart';
import '../home.dart';

class HitAndBlowScreen extends StatefulWidget {
  const HitAndBlowScreen({super.key});

  @override
  State<HitAndBlowScreen> createState() => _HitAndBlowScreenState();
}

class _HitAndBlowScreenState extends State<HitAndBlowScreen> {
  static List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.black,
    Colors.white,
  ];

  static Random rand = Random();

  List<Color> solution = [
    colors[rand.nextInt(colors.length)],
    colors[rand.nextInt(colors.length)],
    colors[rand.nextInt(colors.length)],
    colors[rand.nextInt(colors.length)]
  ];

  int guesses = 1;

  Widget guessingArea() {
    return Row(
      children: [
        const SizedBox(width: 10),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.black,
              )
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.black,
              )
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.black,
              )
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.black,
              )
          ),
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
              guessingArea(),
              const SizedBox(height: 20),
              guessingArea(),
              const SizedBox(height: 20),
              guessingArea(),
              const SizedBox(height: 20),
              guessingArea(),
              const SizedBox(height: 20),
              guessingArea(),
              const SizedBox(height: 20),
              guessingArea(),
              const SizedBox(height: 20),
              guessingArea(),
              const SizedBox(height: 20),
              guessingArea(),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                    onPressed: () {},
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