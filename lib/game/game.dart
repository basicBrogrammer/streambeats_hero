import 'dart:convert';

import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streambeats_hero/game/obstacle_manager.dart';

class StreambeatsHeroGame extends BaseGame {
  static const int squareSpeed = 400;
  static final squarePaint = BasicPalette.white.paint();
  late Rect squarePos;
  int squareDirection = 1;

  @override
  Future<void> onLoad() async {
    var data = await rootBundle.loadString('assets/music_data/lightwire.json');
    var musicJSON = json.decode(data);
    var _obstacleManager =
        ObstacleManager(musicJSON['tempo'], musicJSON['beats']);
    add(_obstacleManager);
    FlameAudio.bgm.play('lightwire.wav');
    // FlameAudio.playLongAudio('music.mp3');
    // var shape = Rectangle(
    //   position: viewport.canvasSize / 2,
    //   size: Vector2(canvasSize.x / 5, 20),
    // );
    // var thing = ShapeComponent(shape, Paint()..color = Colors.white);

    // add(thing);
  }

  @override
  void onDetach() {
    super.onDetach();
    FlameAudio.bgm.stop();
  }
}
