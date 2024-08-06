import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Obstacles extends BodyComponent {
  @override
  final Vector2 position;
  final Sprite sprite;

  Obstacles(this.position, this.sprite);
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
    //final sprite = await game.loadSprite(sprite);

    add(SpriteComponent(
      sprite: sprite,
      size: Vector2.all(40),
      anchor: Anchor.center,
    ));
  }

  @override
  Body createBody() {
    final shape = PolygonShape();
    final vertices = [
      Vector2(-5, -20),
      Vector2(5, -20),
      Vector2(5, 20),
      Vector2(-5, 20),
    ];
    shape.set(vertices);
    shape.set(vertices);
    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef =
        BodyDef(userData: this, type: BodyType.dynamic, position: position);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
