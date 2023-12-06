import 'package:csc322_game_app/games/platformer/overlays/main_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:csc322_game_app/games/platformer/game.dart';

class GamePlayScreen extends StatelessWidget {
  const GamePlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SimplePlatformer platformerGame = SimplePlatformer();

    return MaterialApp(
      home: Scaffold(
        body: GameWidget<SimplePlatformer>(
          game: platformerGame,
          overlayBuilderMap: {
            MainMenu.id: (context, game) => MainMenu(game: game),
            // Add other overlays if needed
          },
          initialActiveOverlays: const [MainMenu.id],
        ),
      ),
    );
  }
}