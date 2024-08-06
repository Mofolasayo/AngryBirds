import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Player extends BodyComponent with TapCallbacks {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
    final sprite = await game.loadSprite('Red.webp');

    add(SpriteComponent(
      sprite: sprite,
      size: Vector2.all(40),
      anchor: Anchor.center,
    ));
  }

  @override
  Body createBody() {
    final shape = CircleShape()..radius = 10;
    final bodyDef = BodyDef(
      position: Vector2(40, 20),
      type: BodyType.dynamic,
    );
    final fixtureDef = FixtureDef(shape, friction: 0.3, density: 1);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

 
  @override
  bool onTapDown(TapDownEvent event) {
    body.applyLinearImpulse(Vector2(40, -20) * 1000);
    return false;
  }
}
