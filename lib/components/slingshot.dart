import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Slingshot extends BodyComponent {
  final Vector2 gameSize;

  Slingshot(this.gameSize);
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
    final sprite = await game.loadSprite('slingshot.webp');

    add(SpriteComponent(
      sprite: sprite,
      size: Vector2.all(60),
      anchor: Anchor.center,
    ));
  }

  @override
  Body createBody() {
    final shape = CircleShape()..radius = 10;
    final bodyDef = BodyDef(
      position: Vector2(70, gameSize.y * 13),
      type: BodyType.static,
    );
    final fixtureDef = FixtureDef(
      shape,
      friction: 0.1,
      density: 0.5,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
