import 'package:angry_birds/components/ground.dart';
import 'package:angry_birds/main.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Pig extends BodyComponent with ContactCallbacks {
  final Vector2 position;
  final Sprite sprite;
  final MyGame game;
  bool isTouchingGround = false;

  Pig(this.position, this.sprite, this.game);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
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
    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef =
        BodyDef(userData: this, type: BodyType.dynamic, position: position);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Ground && !isTouchingGround) {
      isTouchingGround = true;
      print('Pig has made contact with the ground');
      game.updateScore(game.score + 100);
    }
  }
}
