import 'package:flutter/material.dart';
import 'games/hit and blow/hit_and_blow.dart';
import 'games/mad libs/mad_libs_home.dart';
import 'scores.dart';
import 'games/platformer/game_play_screen.dart';

String playerName = '';

class GameHomeScreen extends StatelessWidget {
  const GameHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Display welcome message with player's name
            Text(
              'Welcome, $playerName',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Flutter Games',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 4, 199),
              ),
              textAlign: TextAlign.center,
            ),
              const SizedBox(height: 10),
              const Text(
                'Choose a Game',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
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
                        'Mad Libs',
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent[400],
                          side: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HitAndBlowScreen())
                          );
                        },
                        child: const Text(
                          'Hit & Blow',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 120,
                    height: 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        side: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const GamePlayScreen()),
                        );
                      },
                      child: const Text(
                        '2D Platformer',
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
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  side: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScoresScreen())
                  );
                },
                child: const Text(
                  'High Scores',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )
    );
  }
}