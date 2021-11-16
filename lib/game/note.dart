import 'package:flame/components.dart';
import 'package:streambeats_hero/game/game.dart';

class Note extends SpriteComponent with HasGameRef<StreambeatsHeroGame> {
  Sprite? sprite;

  Note({
    Vector2? position,
    Vector2? size,
    int? priority,
    required this.sprite,
  }) : super(position: position, size: size, priority: priority);

  @override
  void update(double dt) {
    super.update(dt);

    if (this.position.y > gameRef.canvasSize.y) {
      gameRef.remove(this);
    }
  }
}
