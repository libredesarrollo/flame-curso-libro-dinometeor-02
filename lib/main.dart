import 'package:dinometeor02/components/background_color_component.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
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

  final world = World();

  late final CameraComponent cameraComponent;

  @override
  void onLoad() {
    var background = BackgroundImageComponent();
    add(world);
    // add(MeteorComponent());
    world.add(background);

    background.loaded.then(
      (value) {
        var player = PlayerComponent(mapSize: background.size);
        // add(player);

        // camera.followComponent(player,
        //     worldBounds:
        //         Rect.fromLTRB(0, 0, background.size.x, background.size.y));

        cameraComponent = CameraComponent(world: world);
        cameraComponent.follow(player);
        cameraComponent.setBounds(
            Rectangle.fromLTRB(0, 0, background.size.x, background.size.y));
        cameraComponent.viewfinder.anchor = const Anchor(0.1, 0.9);
        add(cameraComponent);

        world.add(player);
      },
    );

    // add(background);

    add(ScreenHitbox());
  }

  @override
  void update(double dt) {
    if (elapsedTime > 1.0) {
      Vector2 cp = cameraComponent.viewfinder.position;

      cp.y = cameraComponent.viewfinder.position.y -
          cameraComponent.viewport.size.y;
      world.add(MeteorComponent(cameraPosition: cp));
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
