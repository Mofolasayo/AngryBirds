import 'package:angry_birds/main.dart';
import 'package:angry_birds/screens/overlays/game_lost_overlay.dart';
import 'package:angry_birds/screens/overlays/game_won_overlay.dart';
import 'package:angry_birds/screens/overlays/pause_overlay_screen.dart';
import 'package:angry_birds/widgets/highscore.dart';
import 'package:angry_birds/widgets/music_toggle.dart';
import 'package:angry_birds/widgets/pause_play.dart';
import 'package:angry_birds/widgets/restart.dart';
import 'package:angry_birds/widgets/score.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget.controlled(
            gameFactory: () {
              return MyGame();
            },
            overlayBuilderMap: {
              "GameWonOverlay": (BuildContext context, MyGame game) {
                return GameWonOverlay();
              },
              "GameLostOverlay": (BuildContext context, MyGame game) {
                return GameLostOverlay();
              },
              "PauseOverlay": (BuildContext context, MyGame game) {
                return PauseOverlay();
              }
            },
          ),
          const Positioned(
            top: 20,
            left: 10,
            child: MusicToggle(),
          ),
          const Positioned(
            top: 20,
            left: 40,
            child: Restart(),
          ),
          const Positioned(
            top: 20,
            left: 70,
            child: PausePlay(),
          ),
          const Positioned(
            top: 20,
            right: 20,
            child: Score(),
          ),
          const Positioned(
            top: 60,
            right: 20,
            child: Highscore(),
          ),
        ],
      ),
    );
  }
}
