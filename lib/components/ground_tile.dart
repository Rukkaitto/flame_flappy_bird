import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class GroundTile extends SpriteComponent
    with HasGameRef<FlappyBird>, HasHitboxes, Collidable {
  GroundTile() {
    final shape = HitboxRectangle(relation: Vector2.all(1.0));
    addHitbox(shape);
  }

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('ground.png');
    width = sprite!.originalSize.x * 3;
    height = sprite!.originalSize.y * 3;
    position = Vector2(0, gameRef.size.y);
    anchor = Anchor.bottomLeft;
  }
}
