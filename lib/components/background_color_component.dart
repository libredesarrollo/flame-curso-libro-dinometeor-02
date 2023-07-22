import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/widgets.dart';

class BackgroundColorComponent extends PositionComponent with HasGameRef {
  static final backgroundPaint = BasicPalette.white.paint();
  late double screenWidth, screenHeight;

  @override
  void onLoad() {
    // screenWidth = MediaQueryData.fromWindow(window).size.width;
    // screenHeight = MediaQueryData.fromWindow(window).size.height;
    screenWidth = gameRef.size.x;
    screenHeight = gameRef.size.y;

    position = Vector2(0, 0);
    size = Vector2(screenWidth, screenHeight);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromPoints(position.toOffset(), size.toOffset()), backgroundPaint);

    super.render(canvas);
  }
}
