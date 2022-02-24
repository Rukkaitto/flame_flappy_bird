import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_flappy_bird/components/background_tile.dart';
import 'package:flame_flappy_bird/components/flappy.dart';
import 'package:flame_flappy_bird/components/ground_tile.dart';
import 'package:flame_flappy_bird/components/infinite_scrolling.dart';
import 'package:flame_flappy_bird/components/scrolling_pipes.dart';

class FlappyBird extends FlameGame with TapDetector, HasCollidables {
  static double backgroundSpeed = 70;
  static double foregroundSpeed = 100;

  final double gravity = -1;
  bool started = false;
  bool isGameOver = false;

  late InfiniteScrolling<BackgroundTile> background;
  late InfiniteScrolling<GroundTile> ground;
  late ScrollingPipes pipes;
  late Flappy player;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    background = InfiniteScrolling(
      tile1: BackgroundTile(),
      tile2: BackgroundTile(),
      speed: backgroundSpeed,
    );
    ground = InfiniteScrolling(
      tile1: GroundTile(),
      tile2: GroundTile(),
      speed: foregroundSpeed,
    );
    pipes = ScrollingPipes();
    player = Flappy();

    add(ScreenCollidable());
    add(background);
    add(pipes);
    add(ground);
    add(player);
  }

  @override
  void onTap() {
    if (!started) {
      started = true;
    }
    if (!isGameOver) {
      player.jump();
    }
  }
}
