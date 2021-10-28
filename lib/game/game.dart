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
  int numOfLanes = 2;
  final String songPath;

  StreambeatsHeroGame(this.songPath);

  @override
  Future<void> onLoad() async {
    var songDataPath = this.songPath + '.json';
    var data = await rootBundle.loadString('assets/music_data/$songDataPath');
    var musicJSON = json.decode(data);

    var _drumsManager = ObstacleManager(
        musicJSON['drum_tempo'], musicJSON['drum_beats'], 0, this.numOfLanes);
    var _otherManager = ObstacleManager(
        musicJSON['other_tempo'], musicJSON['other_beats'], 1, this.numOfLanes);

    add(_drumsManager);
    add(_otherManager);
    // FlameAudio.bgm.play('audio/edm/Dansu/11. Finding My way.wav');
    // FlameAudio.playLongAudio('music.mp3');
  }

  @override
  void onDetach() {
    super.onDetach();
    FlameAudio.bgm.stop();
  }
}
