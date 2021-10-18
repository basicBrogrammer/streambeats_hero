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
  final String songPath;

  StreambeatsHeroGame(this.songPath);

  @override
  Future<void> onLoad() async {
    var songDataPath = this.songPath + '.json';
    var data = await rootBundle.loadString('assets/music_data/$songDataPath');
    print(data);
    var musicJSON = json.decode(data);
    var _obstacleManager =
        ObstacleManager(musicJSON['drum_tempo'], musicJSON['drum_beats']);
    add(_obstacleManager);
    // FlameAudio.bgm.play('audio/edm/Dansu/11. Finding My way.wav');
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
