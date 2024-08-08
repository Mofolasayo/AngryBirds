import 'package:angry_birds/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Score extends StatelessWidget {
  final MyGame game;

  const Score({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: game.scoreNotifier,
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color.fromRGBO(121, 85, 72, 0.637),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Text(
                'Score: ',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                '$value',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
