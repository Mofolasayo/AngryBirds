import 'package:angry_birds/components/ground.dart';
import 'package:angry_birds/components/obstacles.dart';
import 'package:angry_birds/components/player.dart';
import 'package:angry_birds/components/slingshot.dart';
import 'package:angry_birds/main.dart';
import 'package:flame/components.dart';

class Level1 extends Component with HasGameRef<MyGame> {
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
      await gameRef.loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(300, 200),
      await gameRef.loadSprite('Barrel.webp'),
    ));
    add(Obstacles(
      Vector2(300, 240),
      await gameRef.loadSprite('Barrel.webp'),
    ));
  }
}
