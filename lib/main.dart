import 'package:angry_birds/levels/level1.dart';
import 'package:angry_birds/levels/level6.dart';
import 'package:angry_birds/overlays/welcome_overlay.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:angry_birds/screens/game_screen.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  MyGame() : super(gravity: Vector2(0, 20));

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
    overlays.add("welcomeScreenOverlay");
    add(SpriteComponent()
      ..sprite = await loadSprite("Site-background-light.webp")
      ..size = size);
  }

  void startGame() {
    overlays.remove("welcomeScreenOverlay");
    overlays.add('pausePlay');
    overlays.add('MusicOverlay');
    overlays.add('RestartOverlay');
    overlays.add('ScoreOverlay');
    overlays.add('HighScoreOverlay');
    add(Level1());
  }

  void viewLevels() {
    overlays.remove("welcomeScreenOverlay");
    overlays.add("levelsOverlay");
  }
}
