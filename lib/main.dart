import 'package:angry_birds/components/ground.dart';
import 'package:angry_birds/components/obstacles.dart';
import 'package:angry_birds/components/player.dart';
import 'package:angry_birds/components/slingshot.dart';
import 'package:angry_birds/levels/level1.dart';
import 'package:angry_birds/levels/level2.dart';
import 'package:angry_birds/levels/level3.dart';
import 'package:angry_birds/levels/level4.dart';
import 'package:angry_birds/levels/level5.dart';
import 'package:angry_birds/levels/level6.dart';
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
    //add(Level1());
    add(Level6());

  }
}


