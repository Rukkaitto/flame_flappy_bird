import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_flappy_bird/components/flappy.dart';

class FlappyBird extends FlameGame with TapDetector {
  final double gravity = -1;
  late Flappy player;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    player = Flappy();
    add(player);
  }

  @override
  void onTap() {
    player.jump();
  }
}
