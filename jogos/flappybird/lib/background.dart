import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappybird/main.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame>{
  
  @override
  onLoad() async{
    // TODO: implement onLoad
    super.onLoad();

    sprite = await gameRef.loadSprite("bg.png");
    size = gameRef.size;
  }
}