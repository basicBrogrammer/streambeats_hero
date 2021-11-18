import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:streambeats_hero/game/game.dart';
import 'package:streambeats_hero/game/notes_manager.dart';
import 'package:streambeats_hero/overlays/game_over.dart';

class Note extends SpriteComponent
    with HasGameRef<StreambeatsHeroGame>, Tappable {
  Sprite? sprite;
  static final initSize = Vector2(60, 85);
  static final finalSize = initSize * NotesManager.scaleFactor;

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
    final marginOfError = finalSize.y * 0.2;
    if (gameRef.goalPosition.y - marginOfError < position.y &&
        position.y < gameRef.goalPosition.y + marginOfError) {
      add(ColorEffect(color: Colors.green, duration: 0.2));
    } else {
      gameRef.paused = true;
      gameRef.overlays.add(GameOver.ID);
    }

    return false;
  }
}
