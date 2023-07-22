import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

class BackgroundImageComponent extends SpriteComponent with HasGameRef {
  late double screenWidth, screenHeight;

  @override
  Future<void>? onLoad() async {
    screenWidth = gameRef.size.x;
    screenHeight = gameRef.size.y;

    position = Vector2(0, 0);

    sprite = await Sprite.load('background.jpg');

    //size = Vector2(screenWidth, screenHeight);
    size = sprite!.originalSize;

    return super.onLoad();
  }
}
