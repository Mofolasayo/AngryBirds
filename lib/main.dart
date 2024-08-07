import 'package:angry_birds/levels/level6.dart';
import 'package:angry_birds/screens/overlays/game_won_overlay.dart';
import 'package:angry_birds/screens/overlays/pause_overlay_screen.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: GameWidget(
        game: Game(),
        overlayBuilderMap: {
          'PauseOverlay': (BuildContext context, Game game) {
            return GameWonOverlay();
          }
        },
      ),
    ),
  ));
}

class Game extends Forge2DGame with TapCallbacks {
  Game() : super(gravity: Vector2(0, 20));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    //add(Level1());
    add(Level6());
    overlays.add('PauseOverlay');
  }
}
