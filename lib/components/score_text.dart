import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class ScoreText extends TextComponent {
  int score;

  ScoreText(this.score)
      : super(
          text: score.toString(),
          textRenderer: TextPaint(
            style: TextStyle(
              fontFamily: '04b_19',
              color: BasicPalette.white.color,
              fontSize: 50,
            ),
          ),
          anchor: Anchor.center,
          priority: 100,
        );

  void incrementScore() {
    score++;
    text = score.toString();
  }
}
