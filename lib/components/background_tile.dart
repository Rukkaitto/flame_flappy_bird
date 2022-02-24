import 'package:flame/components.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class BackgroundTile extends SpriteComponent with HasGameRef<FlappyBird> {
  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('background.png');
    height = gameRef.size.y;
    width = height * sprite!.originalSize.x / sprite!.originalSize.y;
  }
}
