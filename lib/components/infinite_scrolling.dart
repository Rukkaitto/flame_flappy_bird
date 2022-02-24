import 'package:flame/components.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class InfiniteScrolling<T extends PositionComponent> extends PositionComponent
    with HasGameRef<FlappyBird> {
  static double speed = 100;

  late T tile1;
  late T tile2;

  InfiniteScrolling({required this.tile1, required this.tile2});

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

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

    tile1.x += -speed * dt;
    tile2.x += -speed * dt;
  }
}
