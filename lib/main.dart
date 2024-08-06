import 'package:angry_birds/components/ground.dart';
import 'package:angry_birds/components/obstacles.dart';
import 'package:angry_birds/components/player.dart';
import 'package:angry_birds/components/slingshot.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(
    game: Game(),
  ));
}

class Game extends Forge2DGame with TapCallbacks {
  Game() : super(gravity: Vector2(0, 20));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final background = SpriteComponent(
      sprite: await loadSprite('Site-background-light.webp'),
      size: size,
    );
    add(background);
    Vector2 worldSize = screenToWorld(camera.viewport.virtualSize);
    add(Ground(worldSize));
    add(Slingshot(worldSize));

    add(Player());

    add(Obstacles(
      Vector2(300, 50),
      await loadSprite('pig.webp'),
    ));
    add(Obstacles(
      Vector2(300, 100),
      await loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(300, 150),
      await loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(300, 200),
      await loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(300, 240),
      await loadSprite('Barrel.webp'),
    ));
  }
}


