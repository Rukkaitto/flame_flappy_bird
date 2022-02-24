import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class Flappy extends SpriteComponent with HasGameRef<FlappyBird> {
  double yVelocity = 0;
  static double jumpVelocity = 20;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('flappy.png');

    width = sprite!.originalSize.x;
    height = sprite!.originalSize.y;
    scale = Vector2.all(3);
    position = gameRef.size / 2;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    if (gameRef.started) {
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
}
