import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:streambeats_hero/game/game.dart';
import 'package:streambeats_hero/game/obstacle.dart';

class ObstacleManager extends BaseComponent
    with HasGameRef<StreambeatsHeroGame> {
  final double bpm;
  final int lane;
  List<dynamic> beats;
  final int lanes;

  final double obstacleHeight = 20;
  late final double _obstacleSpeed;
  double elapsedTime = 0;

  ObstacleManager(this.bpm, this.beats, this.lane, this.lanes) : super() {
    _obstacleSpeed = 3 * this.bpm / 60;
  }

  void _spawnObstacle() {
    var width = gameRef.canvasSize.x / this.lanes;
    var shape = Rectangle(
      position: Vector2(width * this.lane, 0),
      size: Vector2(width, obstacleHeight),
    );

    var obstacle =
        Obstacle(_obstacleSpeed, shape, Paint()..color = Colors.white);
    gameRef.add(obstacle);
  }

  @override
  void update(double dt) {
    super.update(dt);
    elapsedTime += dt;
    double offset = gameRef.canvasSize.y / (obstacleHeight * _obstacleSpeed);
    if (beats.length > 0 && elapsedTime > beats.first - offset) {
      print('ElapsedTime: $elapsedTime');
      print('Next: ${beats.first}');
      _spawnObstacle();
      beats.removeAt(0);
    }
  }
}
