import 'package:angry_birds/main.dart';
import 'package:flutter/material.dart';

class WelcomeOverlay extends StatelessWidget {
  final MyGame game;

  const WelcomeOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 20,
            width: 200,
            color: Colors.black,
          ),
          Container(
              width: 200,
              height: 56,
              child: Image.asset("assets/images/textLogo.webp")),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateColor.transparent,
                foregroundColor: WidgetStateColor.transparent),
            onPressed: () {
              game.startGame();
            },
            child: const Text(
              'Start Game',
              style: TextStyle(fontFamily: "Steelar", color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateColor.transparent),
            onPressed: () {
              // Implement other buttons if needed
            },
            child: const Text(
              'LEVELS',
              style: TextStyle(fontFamily: "Steelar", color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
