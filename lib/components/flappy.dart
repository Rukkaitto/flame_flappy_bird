import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame_flappy_bird/components/ground_tile.dart';
import 'package:flame_flappy_bird/components/pipe.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class Flappy extends SpriteAnimationComponent
    with HasGameRef<FlappyBird>, HasHitboxes, Collidable {
  double yVelocity = 0;
  bool isGrounded = false;
  static double jumpVelocity = 20;

  Flappy() {
    final shape = HitboxRectangle(relation: Vector2.all(1.0));
    addHitbox(shape);
  }

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    final frames = [
      await gameRef.loadSprite('flappy/flappy_1.png'),
      await gameRef.loadSprite('flappy/flappy_2.png'),
      await gameRef.loadSprite('flappy/flappy_3.png'),
    ];
    animation = SpriteAnimation.spriteList(
      frames,
      stepTime: 0.1,
    );

    width = frames.first.originalSize.x;
    height = frames.first.originalSize.y;
    scale = Vector2.all(3);
    position = gameRef.size / 2;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    if (!isGrounded) {
      animation?.update(dt);
    }
    if (gameRef.started && !isGrounded) {
      // Add gravity to the y velocity
      yVelocity += gameRef.gravity;

      // Apply y velocity to position
      position += Vector2(0, -yVelocity);

      // Rotate the sprite depending on the velocity and clamp it between -45 and 45 degrees
      angle = (-yVelocity * 0.04).clamp(-pi / 2, pi / 2);
    }
  }

  void jump() {
    yVelocity = jumpVelocity;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is GroundTile || other is Pipe) {
      isGrounded = true;
    }
    gameRef.isGameOver = true;
  }
}
