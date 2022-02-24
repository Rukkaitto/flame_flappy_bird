import 'package:flame/components.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class InfiniteScrolling<T extends PositionComponent> extends PositionComponent
    with HasGameRef<FlappyBird> {
  late double speed;
  late T tile1;
  late T tile2;

  InfiniteScrolling({
    required this.tile1,
    required this.tile2,
    required this.speed,
  });

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    add(tile1);
    add(tile2);
  }

  @override
  void update(double dt) {
    // Ensure that tile1 is always to the the right of tile2
    tile1.x = tile2.x + tile2.width - 1;

    // Swap the tile positions if tile2 is off screen
    if (tile2.x < -tile2.width) {
      final tile2X = tile2.x;
      tile2.x = tile1.x;
      tile1.x = tile2X;
    }

    // Move the tiles to the left by the speed
    tile1.x += -speed * dt;
    tile2.x += -speed * dt;
  }
}
