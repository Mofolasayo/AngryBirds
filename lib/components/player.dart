import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Player extends BodyComponent {
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
    final sprite = await game.loadSprite('Red.webp');

    add(SpriteComponent(
        sprite: sprite, size: Vector2.all(40), anchor: Anchor.center));
  }

  @override
  Body createBody() {
    Shape shape = CircleShape()..radius = 10;
    BodyDef bodyDef = BodyDef(position: Vector2(10, 5), type: BodyType.dynamic);
    FixtureDef fixtureDef = FixtureDef(shape, friction: 0.3, density: 1);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
