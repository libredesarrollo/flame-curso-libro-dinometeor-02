import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/widgets.dart';

class BackgroundColorComponent extends PositionComponent {
  static final backgroundPaint = BasicPalette.white.paint();
  late double screenWidth, screenHeight;

  @override
  Future<void>? onLoad() {
    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight = MediaQueryData.fromWindow(window).size.height;

    position = Vector2(0, 0);
    size = Vector2(screenWidth, screenHeight);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromPoints(position.toOffset(), size.toOffset()), backgroundPaint);

    super.render(canvas);
  }
}
