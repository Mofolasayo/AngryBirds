import 'package:angry_birds/components/ground.dart';
import 'package:angry_birds/levels/level1.dart';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:angry_birds/screens/game_screen.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame_audio/flame_audio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GameScreen(),
  ));
}

class MyGame extends Forge2DGame with TapCallbacks {
  bool isPaused = false;
  bool isMusicPlaying = true;
  int score = 0;
  final ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);

  MyGame() : super(gravity: Vector2(0, 20));

  void toggleMusic() {
    if (isMusicPlaying) {
      FlameAudio.bgm.pause();
    } else {
      FlameAudio.bgm.resume();
    }
    isMusicPlaying = !isMusicPlaying;
  }

  void updateScore(int newScore) {
    score = newScore;
    scoreNotifier.value = score;
    print('Score updated: $score');
  }

  void togglePause() {
    isPaused = !isPaused;
    if (isPaused) {
      pauseEngine();
    } else {
      resumeEngine();
    }
  }

  @override
  void update(double dt) {
    if (!isPaused) {
      super.update(dt);
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('bg_music.mp3', volume: 0.5);
    overlays.add("welcomeScreenOverlay");
    add(SpriteComponent()
      ..sprite = await loadSprite("Site-background-light.webp")
      ..size = size);
    add(Ground(size));
  }

  void startGame() {
    FlameAudio.bgm.stop();
    FlameAudio.bgm.play('in_game.mp3', volume: 0.0);
    overlays.remove("welcomeScreenOverlay");
    overlays.add('pausePlay');
    overlays.add('MusicOverlay');
    overlays.add('RestartOverlay');
    overlays.add('scoreOverlay');
    overlays.add('highScoreOverlay');
    add(Level1());
  }

  void viewLevels() {
    overlays.remove("welcomeScreenOverlay");
    overlays.add("backButtonOverlay");
    overlays.add("levelsOverlay");
  }

  void backAction(String overlayName) {
    overlays.remove(overlayName);
    overlays.remove("levelsOverlay");
    overlays.add("welcomeScreenOverlay");
  }

  void loadLevel(Component comp) {
    overlays.remove("levelsOverlay");
    overlays.remove("backButtonOverlay");
    overlays.add('pausePlay');
    overlays.add('MusicOverlay');
    overlays.add('RestartOverlay');
    overlays.add('scoreOverlay');
    overlays.add('highScoreOverlay');
    add(comp);
  }
}
