import 'package:flame/components.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class Flappy extends SpriteComponent with HasGameRef<FlappyBird> {
  double yVelocity = 0;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('flappy.png');

    width = sprite!.originalSize.x;
    height = sprite!.originalSize.y;
    scale = Vector2.all(4);
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 3);
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    // Add gravity to the y velocity
    yVelocity += gameRef.gravity;

    // Apply y velocity to position
    position += Vector2(0, -yVelocity);

    angle = -yVelocity * 0.04;
  }

  void jump() {
    yVelocity = 20;
  }
}
