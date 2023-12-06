import 'dart:math';
import 'package:flutter/material.dart';
import '../../home.dart';

const List<Color> colors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple,
];

const defaultGuesses = [Colors.grey, Colors.grey, Colors.grey, Colors.grey];

class HitAndBlowScreen extends StatefulWidget {
  const HitAndBlowScreen({super.key});

  @override
  State<HitAndBlowScreen> createState() => _HitAndBlowScreenState();
}

List<Color> generateRandom() {
  List<Color> solution = [];
  for (int i = 0; i < 4; i++) {
    solution.add(colors[Random().nextInt(colors.length)]);
  }
  return solution;
}

List<Color> solution = generateRandom();

bool gameOver = false;

class _HitAndBlowScreenState extends State<HitAndBlowScreen> {
  List<List<Color>> previousGuesses = [];

  void resetState() {
    setState(() {
      previousGuesses = [];
      gameOver = false;
      solution = generateRandom();
    });
  }

  void addGuess(List<Color> guess) {
    setState(() {
      previousGuesses.add(guess);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      body: SingleChildScrollView(
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: previousGuesses.length + 1,
              itemBuilder: (context, index) {
                Widget r;
                if (index == previousGuesses.length) {
                  final guess = index == 0
                      ? Guess(isCurrent: true, notifyPage: addGuess)
                      : Guess(isCurrent: true, guess: previousGuesses[index - 1], notifyPage: addGuess);
                  r = !gameOver
                      ? guess
                      : GestureDetector(
                      onTap: () {
                        resetState();
                      },
                      child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Solved with ${previousGuesses.length} guesses!',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                      )
                  );
                } else {
                  r = Guess(
                    isCurrent: false,
                    guess: previousGuesses[index],
                    notifyPage: addGuess,
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: r,
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: resetState,
                  child: const Text(
                      "Restart"
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GameHomeScreen())
                    );
                  },
                  child: const Text(
                    "Home"
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class Guess extends StatefulWidget {
  const Guess({super.key, required this.isCurrent, this.guess = defaultGuesses, required this.notifyPage});

  final Function(List<Color>) notifyPage;
  final bool isCurrent;
  final List<Color> guess;

  @override
  _GuessState createState() => _GuessState(guess);
}

class _GuessState extends State<Guess> {
  List<Color> guess;

  _GuessState(guesses) : guess = List.from(guesses);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    guess.asMap().forEach((idx, g) {
      items.add(GestureDetector(
        onTap: () {
          if (!widget.isCurrent) {
            return;
          }
          setState(() {
            guess[idx] = colors[(colors.indexOf(g) + 1) % colors.length];
          });
        },
        child: Container(
          decoration:
          BoxDecoration(
            shape: BoxShape.circle,
            color: g,
            border: Border.all(
              width: 1,
              color: Colors.black,
            )
          ),
          width: 60,
          height: 60,
        ),
      ));
    });
    if (widget.isCurrent) {
      items.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: Colors.black
            ),
          ),
          child: IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                widget.notifyPage(guess);
              }
          ),
        ),
      );
    } else {
      int correct = 0;
      for (int i = 0; i < guess.length; i++) {
        if (guess[i] == solution[i]) {
          correct++;
        }
      }
      int correctColors = 0;
      final secretCounts = getCounts(solution);
      final guessCounts = getCounts(guess);
      for (Color c in secretCounts.keys) {
        correctColors += min(guessCounts[c]!, secretCounts[c]!);
      }
      items.add(SizedBox(
        width: 50,
        child: Text(
          '$correct   $correctColors',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ));
      if (correct == 4) {
        setState(() {
          gameOver = true;
        });
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items,
    );
  }
}

Map<Color, int> getCounts(List<Color> guess) {
  Map<Color, int> counts = {};
  for (Color c in colors) {
    counts[c] = 0;
  }
  for (Color c in guess) {
    counts.update(c, (value) => ++value);
  }
  return counts;
}