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
<<<<<<< HEAD
    // Vector2 gameSize = screenToWorld(camera.viewport.virtualSize);
    add(SpriteComponent()
      ..sprite = await loadSprite("Site-background-light.webp")
      ..size = size);
    overlays.add('WelcomeOverlay');
    // add(Level1());
    // add(Level6());
  }

  void startGame() {
    overlays.remove('WelcomeOverlay'); // Remove the welcome screen overlay
    // Add game initialization logic here
    add(Level1());
=======
    add(Level6());
    
    //overlays.add('PauseOverlay');
>>>>>>> 024bff29e628718f1c1a2d0e04fd5319ebca1ecf
  }
}
