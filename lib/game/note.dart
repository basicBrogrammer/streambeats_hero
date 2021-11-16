import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:streambeats_hero/game/game.dart';
import 'package:streambeats_hero/game/notes_manager.dart';

class Note extends SpriteComponent
    with HasGameRef<StreambeatsHeroGame>, Tappable {
  Sprite? sprite;
  static final initSize = Vector2(60, 85);

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

  @override
  bool onTapDown(TapDownInfo info) {
    if (info.eventPosition.game.y > 2 * NotesManager.scaleFactor * initSize.y) {
      add(ColorEffect(color: Colors.green, duration: 0.5));
    } else {
      add(ColorEffect(color: Colors.red, duration: 0.5));
    }
    return false;
  }
}
