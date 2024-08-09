import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class TrajectoryLine extends Component {
  Vector2 startPoint;
  Vector2 direction;
  final int segmentCount;
  final double segmentLength;
  final double gapLength;

  TrajectoryLine({
    required this.startPoint,
    required this.direction,
    this.segmentCount = 10,
    this.segmentLength = 10,
    this.gapLength = 5,
  });

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Vector2 currentPoint = startPoint;
    for (int i = 0; i < segmentCount; i++) {
      final nextPoint = currentPoint + direction.normalized() * segmentLength;
      canvas.drawLine(currentPoint.toOffset(), nextPoint.toOffset(), paint);
      currentPoint = nextPoint + direction.normalized() * gapLength;
    }
  }
}

class Player extends BodyComponent with DragCallbacks, TapCallbacks {
  final Sprite sprite;
  final double speed = 400;
  late Vector2 initialPosition;
  TrajectoryLine? trajectoryLine;

  bool isDragging = false;
  // final Vector2 initialPosition = Vector2(70, 20);

  Player(this.sprite);
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
    initialPosition = body.position.clone();

    // final x = body.position;
  }

  @override
  Body createBody() {
    final shape = CircleShape()..radius = 10;
    final bodyDef = BodyDef(
      position: Vector2(70, 50),
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

  // @override
  // void onDragStart(DragStartEvent event) {
  //   super.onDragStart(event);
  //   isDragging = true;
  //   initialPosition = body.position
  //       .clone(); // Update the initial position to the current position

  //   // body.linearVelocity(Vector2.zero());
  //   trajectoryLine = TrajectoryLine(
  //     startPoint: body.position.clone(),
  //     direction: initialPosition - body.position,
  //   );
  //   game.add(trajectoryLine!);
  // }

  // @override
  // void onDragUpdate(DragUpdateEvent event) {
  //   super.onDragUpdate(event);
  //   if (isDragging) {
  //     final dragPosition = event.localStartPosition;
  //     if (dragPosition.x < initialPosition.x) {
  //       final worldPosition = Vector2(
  //           dragPosition.x, dragPosition.y); // Adjusting for camera zoom
  //       body.setTransform(worldPosition, body.angle);
  //       // body.setTransform(dragPosition, body.angle);
  //       sprite.srcPosition = dragPosition;

  //       trajectoryLine?.startPoint = body.position;
  //       trajectoryLine?.direction = initialPosition - body.position;
  //     }
  //   }
  // }

  // @override
  // void onDragEnd(DragEndEvent event) {
  //   super.onDragEnd(event);
  //   isDragging = false;
  //   // trajectoryLine?.remove(Tra);
  //   trajectoryLine = null;

  //   // Enable gravity when drag ends
  //   // body.setGravityScale(Vector2(0, 1));

  //   // Calculate force based on drag distance
  //   // final force = initialPosition - body.position;
  //   Vector2 impulse = Vector2(60, -30) * 100 * speed;
  //   body.applyLinearImpulse(impulse);
  //   // Propel the player forward based on the drag distance
  //   // body.applyLinearImpulse();
  //   sprite.srcPosition = body.position;
  // }
}
