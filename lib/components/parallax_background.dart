import 'package:flame/components.dart';
import 'package:flame_flappy_bird/components/background_tile.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class ParallaxBackground extends PositionComponent with HasGameRef<FlappyBird> {
  static double speed = 100;

  late BackgroundTile tile1;
  late BackgroundTile tile2;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    tile1 = BackgroundTile();
    tile2 = BackgroundTile();
    add(tile1);
    add(tile2);
  }

  @override
  void update(double dt) {
    tile1.x = tile2.x + tile2.width - 1;
    if (tile2.x < -tile2.width) {
      final tile2X = tile2.x;
      tile2.x = tile1.x;
      tile1.x = tile2X;
    }
  }
}
