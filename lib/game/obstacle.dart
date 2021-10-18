import 'package:flame/components.dart';
import 'package:streambeats_hero/game/game.dart';

class Obstacle extends ShapeComponent with HasGameRef<StreambeatsHeroGame> {
  double speed;

  Obstacle(
    this.speed,
    shape,
    shapePaint, {
    Anchor anchor = Anchor.centerLeft,
    int? priority,
  }) : super(shape, shapePaint, anchor: anchor, priority: priority);

  @override
  void update(double dt) {
    super.update(dt);
    // x1 = x0 + v * dt
    this.position += Vector2(0, size.y) * this.speed * dt;

    if (this.position.y > gameRef.canvasSize.y) {
      remove();
    }
  }
}
