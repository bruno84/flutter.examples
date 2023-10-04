import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappybird/spike.dart';
import 'package:flame/sprite.dart';

import 'apple.dart';
import 'main.dart';

class Person extends SpriteAnimationComponent
    with
        TapCallbacks,
        HasGameRef<FlappyBirdGame>,
        HasCollisionDetection,
        CollisionCallbacks {
  double vx = 0; //m/s
  double vy = 0; //m/s
  double ax = 0;
  double ay = 600;

  int countApple = 0;
  late SpriteSheet idleSpriteSheet, hitSpriteSheet;
  late SpriteAnimation idleAnimation, hitAnimation;
//final animation = spriteSheet.createAnimation(0, stepTime: 0.1);
bool gameOver = false;
  @override
  void onLoad() async {
    //sprite = await gameRef.loadSprite('person.png');
    position = gameRef.size / 2;
    size = Vector2(64.0, 64.0);
    anchor = Anchor.center;
   
    //debugMode = true;
    idleSpriteSheet = SpriteSheet(
      image: await gameRef.images.load('idle.png'),
      srcSize: Vector2.all(32.0),
    );
    hitSpriteSheet = SpriteSheet(
      image: await gameRef.images.load('hit.png'),
      srcSize: Vector2.all(32.0),
    );

    idleAnimation = idleSpriteSheet.createAnimation(
        row: 0, stepTime: 0.2, from: 0, to: 6, loop: true);
    hitAnimation = hitSpriteSheet.createAnimation(
        row: 0, stepTime: 0.2, from: 0, to: 10, loop: false);

    //define a animação atual
    animation = idleAnimation;
     //add(RectangleHitbox(isSolid: true, size: Vector2(32,32),position: Vector2(200,200),collisionType: CollisionType.active));
   super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {  
    if (other is Spike) {
      removeFromParent();
    }else if(other is Apple) {
      ++countApple;
    }
  }

  @override
  void onTapUp(TapUpEvent event) async {
    // Do something in response to a tap event
    //sprite = await gameRef.loadSprite('person2.png');
    scale = Vector2(1, -2);
    animation = hitAnimation;
    print("tocou person");
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    scale = Vector2(1.5, 1.5);
  }

  void jump() {
    vy = -400;
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    vy += ay * dt;
    if(position.y - 40 >= gameRef.size.y){
      ay=0;
      vy=0;
      gameOver = true;
      removeFromParent();
    }
    position.x += vx * dt;
    position.y += vy * dt;

    
  }
}
