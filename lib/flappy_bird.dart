import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_flappy_bird/components/background_tile.dart';
import 'package:flame_flappy_bird/components/flappy.dart';
import 'package:flame_flappy_bird/components/infinite_scrolling.dart';

class FlappyBird extends FlameGame with TapDetector {
  final double gravity = -1;
  bool started = false;

  late Flappy player;
  late InfiniteScrolling<BackgroundTile> background;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    background = InfiniteScrolling(
      tile1: BackgroundTile(),
      tile2: BackgroundTile(),
    );
    player = Flappy();

    add(background);
    add(player);
  }

  @override
  void onTap() {
    if (!started) {
      started = true;
    }
    player.jump();
  }
}
