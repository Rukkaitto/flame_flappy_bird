import 'package:flame/components.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class GroundTile extends SpriteComponent with HasGameRef<FlappyBird> {
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
