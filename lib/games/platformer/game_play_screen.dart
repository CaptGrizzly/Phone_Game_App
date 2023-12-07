import 'package:csc322_game_app/games/platformer/pixel_adventure.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(const GamePlayScreen());
}

class GamePlayScreen extends StatelessWidget {
  const GamePlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PixelAdventure pixelAdventure = PixelAdventure();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Platformer Game'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              runApp(
                MaterialApp(
                  home: Scaffold(
                    body: GameWidget(
                      game: pixelAdventure,
                    ),
                  ),
                ),
              );
            },
            child: Text('Start Platformer Game'),
          ),
        ),
      ),
    );
  }
}
