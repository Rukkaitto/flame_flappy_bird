import 'package:flame/game.dart';
import 'package:flame_flappy_bird/flappy_bird.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBird();
  runApp(GameWidget(game: game));
}
