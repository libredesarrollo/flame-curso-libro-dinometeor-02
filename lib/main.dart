import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

import 'package:dinometeor02/components/meteor_component.dart';
import 'package:dinometeor02/components/player_component.dart';
import 'package:dinometeor02/components/background_image_component.dart';

class MyGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  double elapsedTime = 0.0;

  @override
  Future<void>? onLoad() {
    
    var background = BackgroundImageComponent();



    // add(MeteorComponent());
    // add(BackgroundColorComponent());

    background.loaded.then(
      (value) {
        var player = PlayerComponent(mapSize:  background.size);
        add(player);

        camera.followComponent(player, worldBounds: Rect.fromLTRB(0, 0, background.size.x, background.size.y));


     

      },
    );

    add(background);

    add(ScreenHitbox());

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (elapsedTime > 1.0) {
      add(MeteorComponent(cameraPosition: camera.position));
      elapsedTime = 0.0;
    }

    elapsedTime += dt;
    super.update(dt);
  }

  @override
  Color backgroundColor() {
    super.backgroundColor();
    return Colors.purple;
  }
}

void main() {
  runApp(GameWidget(game: MyGame()));
}
