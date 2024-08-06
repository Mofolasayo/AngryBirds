import 'package:angry_birds/components/ground.dart';
import 'package:angry_birds/components/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: Game()));
}

class Game extends Forge2DGame with TapCallbacks {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final background = SpriteComponent(
      sprite: await loadSprite('beach_background.webp'),
      size: size,
    );
    add(background);
    Vector2 worldSize = screenToWorld(camera.viewport.virtualSize);
    add(Ground(worldSize));
    add(Player());
  }
}

