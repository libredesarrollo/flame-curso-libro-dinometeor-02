import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

class BackgroundImageComponent extends SpriteComponent {
  late double screenWidth, screenHeight;

  @override
  Future<void>? onLoad() async{
    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight = MediaQueryData.fromWindow(window).size.height;

    position = Vector2(0, 0);

    sprite = await Sprite.load('background.jpg');

    //size = Vector2(screenWidth, screenHeight);
    size = sprite!.originalSize;

    return super.onLoad();
  }
}
