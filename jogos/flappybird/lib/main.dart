import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/person.dart';
import 'package:flappybird/spike.dart';
import 'package:flutter/material.dart';

import 'apple.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  //Flame.device.setLandscape();
  runApp(GameWidget(
    game: FlappyBirdGame(),
    loadingBuilder: (context) {
      return Text("loading");
    },
  ));
}

class FlappyBirdGame extends FlameGame with TapCallbacks {
  late Person _person;
  late Spike _spike;
  late Apple _apple;
  final scoreStyle = TextPaint(
    style: TextStyle(
      fontSize: 48.0,
      color: BasicPalette.white.color,
    ),
  );
  double score = 1;
  int velocityScore = 2;
  late TextComponent tc;
  @override
  Future<void> onLoad() async {
    final images = [
      loadParallaxImage('bg.png', repeat: ImageRepeat.repeat),
      loadParallaxImage(
        'terrain.png',
        repeat: ImageRepeat.repeatX,
        alignment: Alignment.bottomCenter,
        fill: LayerFill.none,
      ),
    ];

    final layers = images.map((image) async => ParallaxLayer(
          await image,
          velocityMultiplier: Vector2((images.indexOf(image) + 1) * 2.0, 0),
        ));
    final parallaxComponent = ParallaxComponent(
      parallax: Parallax(
        await Future.wait(layers),
        baseVelocity: Vector2(50, 0),
      ),
    );
    add(parallaxComponent);
    //cria personagem principal
    _person = Person();
    add(_person);
    //cria personagem inimigo
    _spike = Spike();
    add(_spike);
    //cria texto de pontos
    tc = TextComponent(
      text: score.floor().toString(),
      textRenderer: scoreStyle,
      anchor: Anchor.topCenter,
      position: Vector2(size.x / 2, 40),
    );
    add(tc);
    //cria maçã
    _apple = Apple();
    add(_apple);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (_person.gameOver == true) {
      tc.text = "GAME OVER\n" + score.floor().toString() + " Pontos";
      _spike.vx = 0;
      _spike.omega = 0;
      _apple.vx = 0;
      
    } else {
      tc.text = score.floor().toString();
      score += velocityScore * dt;
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    // Do something in response to a tap event
    print("tocou jogo");
    _person.jump();
  }
}
