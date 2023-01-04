
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

import 'package:dinometeor02/components/meteor_component.dart';
import 'package:dinometeor02/components/player_component.dart';
import 'package:dinometeor02/components/background_image_component.dart';

class MyGame extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection{

  double elapsedTime = 0.0;

  @override
  Future<void>? onLoad() {
    
    var player = PlayerComponent();
    var background = BackgroundImageComponent();
    // add(MeteorComponent());
    // add(BackgroundColorComponent());

    
     background.loaded.then((value) {
        print('cargado');
        print(background.isLoaded);
        print(background.size.x.toString());
            print('player');
        add(player);
     },);


    add(background);

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

  @override
  Color backgroundColor() {
    super.backgroundColor();
    return Colors.purple;
  }

}

void main() {
  runApp(GameWidget(game: MyGame()));
}
