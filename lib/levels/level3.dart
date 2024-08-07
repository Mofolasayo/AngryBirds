import 'package:angry_birds/components/ground.dart';
import 'package:angry_birds/components/obstacles.dart';
import 'package:angry_birds/components/player.dart';
import 'package:angry_birds/components/slingshot.dart';
import 'package:angry_birds/main.dart';
import 'package:flame/components.dart';

class Level3 extends Component with HasGameRef<MyGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final background = SpriteComponent(
      sprite: await gameRef.loadSprite('Site-background-light.webp'),
      size: gameRef.size,
    );
    add(background);
    Vector2 worldSize =
        gameRef.screenToWorld(gameRef.camera.viewport.virtualSize);
    add(Ground(worldSize));
    add(Slingshot(worldSize));

    add(Player(
      await gameRef.loadSprite('Chuck_Classic_Old.webp'),
    ));
    add(Player(
      await gameRef.loadSprite('Red.webp'),
    ));

    add(Obstacles(
      Vector2(300, 50),
      await gameRef.loadSprite('pig.webp'),
    ));
    add(Obstacles(
      Vector2(300, 100),
      await gameRef.loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(300, 150),
      await gameRef.loadSprite('Wooden_Crate.webp'),
    ));
    add(Obstacles(
      Vector2(300, 200),
      await gameRef.loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(300, 240),
      await gameRef.loadSprite('Wooden_Crate.webp'),
    ));

    add(Obstacles(
      Vector2(350, 50),
      await gameRef.loadSprite('pig.webp'),
    ));
    add(Obstacles(
      Vector2(350, 100),
      await gameRef.loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(350, 150),
      await gameRef.loadSprite('Wooden_Crate.webp'),
    ));
    add(Obstacles(
      Vector2(350, 200),
      await gameRef.loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(350, 240),
      await gameRef.loadSprite('Wooden_Crate.webp'),
    ));

    add(Obstacles(
      Vector2(400, 50),
      await gameRef.loadSprite('pig.webp'),
    ));
    add(Obstacles(
      Vector2(400, 100),
      await gameRef.loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(400, 150),
      await gameRef.loadSprite('Wooden_Crate.webp'),
    ));
    add(Obstacles(
      Vector2(400, 200),
      await gameRef.loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(400, 240),
      await gameRef.loadSprite('Wooden_Crate.webp'),
    ));
    add(Obstacles(
      Vector2(400, 300),
      await gameRef.loadSprite('Wooden_Crate.webp'),
    ));
  }
}
