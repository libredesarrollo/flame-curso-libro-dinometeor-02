import 'package:dinometeor02/components/meteor_component.dart';
import 'package:dinometeor02/components/player_component.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

import 'package:flame/game.dart';
import 'package:flame/input.dart';


class MyGame extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection{

  double elapsedTime = 0.0;

  @override
  Future<void>? onLoad() {
    
    // add(MeteorComponent());
    add(PlayerComponent());
    add(ScreenHitbox());


    return super.onLoad();
  }

  @override
  void update(double dt) {

    if(elapsedTime > 1.0){
     add(MeteorComponent());
      elapsedTime = 0.0;
    }

    elapsedTime += dt;
    super.update(dt);
  }

}

void main() {
  runApp(GameWidget(game: MyGame()));
}
