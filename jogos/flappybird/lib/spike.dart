import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Spike extends SpriteComponent
    with TapCallbacks, HasGameRef<FlappyBirdGame>,HasCollisionDetection,CollisionCallbacks{
      late double omega;//velocidade angular
      late double vx;
  @override
  void onLoad() async {
    omega = pi;
    vx = 200;
    sprite = await gameRef.loadSprite('spike.png');
    position = gameRef.size / 2;
    size = Vector2(64.0, 64.0);
    anchor = Anchor.center;
     
     //debugMode = true;
  }

  @override
  void onTapUp(TapUpEvent event)async {
    // Do something in response to a tap event
    sprite = await gameRef.loadSprite('spike2.png');
     
    print("tocou spike");
  }


  @override
  void update(double dt) {
    super.update(dt);
    angle += omega*dt;
    position.x -= vx*dt;
    if(position.x < 0){
      position.x = 400;
    
      position.y = Random().nextInt(gameRef.size.y.toInt()).toDouble();
    }
  }
}