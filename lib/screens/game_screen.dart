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
import 'package:angry_birds/overlays/welcome_overlay.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late MyGame game;

  @override
  void initState() {
    super.initState();
    game = MyGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget.controlled(
            gameFactory: () => game,
            overlayBuilderMap: {
              'welcomeScreenOverlay': (BuildContext context, MyGame game) {
                return Center(
                  child: WelcomeOverlay(game),
                );
              },
              'pausePlay': (BuildContext context, MyGame game) {
                return Positioned(
                  top: 20,
                  left: 70,
                  child: PausePlay(game: game),
                );
              },
              "GameWonOverlay": (BuildContext context, MyGame game) {
                return const GameWonOverlay();
              },
              "GameLostOverlay": (BuildContext context, MyGame game) {
                return const GameLostOverlay();
              },
              "PauseOverlay": (BuildContext context, MyGame game) {
                return PauseOverlay(game: game);
              },
              "MusicOverlay": (BuildContext context, MyGame game) {
                return Positioned(
                    top: 20, left: 10, child: MusicToggle(game: game));
              },
              "RestartOverlay": (BuildContext context, MyGame game) {
                return const Positioned(top: 20, left: 40, child: Restart());
              },
              "scoreOverlay": (BuildContext context, MyGame game) {
                return Positioned(
                  top: 20,
                  right: 20,
                  child: Score(game: game),
                );
              },
              "highScoreOverlay": (BuildContext context, MyGame game) {
                return const Positioned(
                  top: 60,
                  right: 20,
                  child: Highscore(),
                );
              },
            
            },
            initialActiveOverlays: const [
              // 'pausePlay',
              // 'MusicOverlay',
              // 'RestartOverlay',
              // 'ScoreOverlay',
              // 'HighScoreOverlay',
            ], // Add this line
          ),
          
        ],
      ),
    );
  }
}
