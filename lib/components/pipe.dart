import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

enum Direction {
  up,
  down,
}

class Pipe extends SpriteComponent
    with HasGameRef<FlappyBird>, HasHitboxes, Collidable {
  final Direction direction;

  Pipe({required this.direction}) {
    final shape = HitboxRectangle(relation: Vector2.all(1.0));
    addHitbox(shape);
  }

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('pipe_${direction.name}.png');
    anchor = direction == Direction.up ? Anchor.topCenter : Anchor.bottomCenter;
    width = sprite!.originalSize.x * 5;
    height = sprite!.originalSize.y * 5;
  }

  @override
  void update(double dt) {
    if (gameRef.isGameOver) {
      return;
    }
    x += -FlappyBird.foregroundSpeed * dt;
  }
}
