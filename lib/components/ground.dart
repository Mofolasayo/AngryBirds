import 'package:flame_forge2d/flame_forge2d.dart';

class Ground extends BodyComponent {
  final Vector2 gameSize;

  Ground(this.gameSize) : super(renderBody: false);
  Body createBody() {
    Shape shape = EdgeShape()
      ..set(Vector2(0, gameSize.y * 18),
          Vector2(gameSize.x * 20, gameSize.y * 18));
    BodyDef bodyDef = BodyDef(userData: this, position: Vector2.zero());
    final fixtureDef = FixtureDef(shape, friction: 0.2);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
