import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappybird/person.dart';
import 'package:flappybird/spike.dart';
import 'package:flame/sprite.dart';

import 'main.dart';
class Apple extends SpriteAnimationComponent
    with TapCallbacks, HasGameRef<FlappyBirdGame>, HasCollisionDetection,CollisionCallbacks {
  double vx = -100; //m/s
  double vy = 0; //m/s
  late final staticHeightApple;

  late SpriteSheet idleSpriteSheet;
  late SpriteAnimation idleAnimation;
//final animation = spriteSheet.createAnimation(0, stepTime: 0.1);

  @override
  void onLoad() async {
    staticHeightApple = gameRef.size.y/2;
    //staticHeightApple = 0;
    //sprite = await gameRef.loadSprite('person.png');
    position = gameRef.size / 2;
    size = Vector2(32.0, 32.0);
    anchor = Anchor.center;
  scale = Vector2(2, 2);
      
    idleSpriteSheet = SpriteSheet(
      image: await gameRef.images.load('apple.png'),
      srcSize: Vector2.all(32.0),
    );
   
    idleAnimation = idleSpriteSheet.createAnimation(row: 0, stepTime: 0.2, to:16);
   
   //define a animação atual
   animation = idleAnimation;
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    
    
    if (other is Person) {
      removeFromParent();
    }
  }

  @override
  void onTapUp(TapUpEvent event) async {
    
    print("tocou apple");
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
   position.x += vx*dt;
   position.y = staticHeightApple +120*cos(position.x/40);
    if(position.x < 0){
      position.x = gameRef.size.x;
    //removeFromParent();
      //position.y = Random().nextInt(gameRef.size.y.toInt()).toDouble();
    }
  }
}