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
  MyGame() : super(gravity: Vector2(0, 20));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
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
  }
}
