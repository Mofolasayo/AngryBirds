import 'package:flame_forge2d/flame_forge2d.dart';

class Ground extends BodyComponent {
  final Vector2 worldSize;

  Ground(this.worldSize) : super(renderBody: false);
  @override
  Body createBody() {
    final shape = EdgeShape()
      ..set(Vector2(0, worldSize.y * 14),
          Vector2(worldSize.x * 20, worldSize.y * 14));
    final bodyDef = BodyDef(userData: this, position: Vector2.zero());
    final fixtureDef = FixtureDef(shape, friction: 0.2);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
