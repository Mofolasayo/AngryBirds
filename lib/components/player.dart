import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Player extends BodyComponent with TapCallbacks {
  final double speed = 400;
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
      position: Vector2(70, 20),
      type: BodyType.dynamic,
      bullet: true, 
      
    );
    final fixtureDef = FixtureDef(
      shape,
      friction: 0.1,
      density: 0.5,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

 
  @override
  bool onTapDown(TapDownEvent event) {
    Vector2 impulse = Vector2(60, -30) * 100 * speed;
    body.applyLinearImpulse(impulse);
    return false;
  }
  
}
