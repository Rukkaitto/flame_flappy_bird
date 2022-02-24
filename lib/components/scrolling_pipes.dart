import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_flappy_bird/components/pipe.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';

class ScrollingPipes extends PositionComponent with HasGameRef<FlappyBird> {
  double scrollCounter = 0;
  static double gap = 150;
  static double pipeReach = 180;
  static double popOffset = 100;
  static double upPipeOffset = 300;
  static double downPipeOffset = 100;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
  }

  // Generate a random double between min and max (inclusive).
  double randomBetween(double min, double max) {
    var rnd = Random();
    return min + rnd.nextDouble() * (max - min);
  }

  void spawnPipe() {
    final direction =
        Direction.values[Random().nextInt(Direction.values.length)];

    double yPosition;

    if (direction == Direction.up) {
      yPosition = gameRef.size.y - upPipeOffset - randomBetween(0, pipeReach);
    } else {
      yPosition = downPipeOffset + randomBetween(0, pipeReach);
    }

    final pipe = Pipe(direction: direction)
      ..position = Vector2(gameRef.size.x + popOffset, yPosition);
    add(pipe);
  }

  @override
  void update(double dt) {
    if (gameRef.isGameOver || !gameRef.started) {
      return;
    }
    scrollCounter += 1;

    if (scrollCounter % gap == 0) {
      spawnPipe();
    }
  }
}
