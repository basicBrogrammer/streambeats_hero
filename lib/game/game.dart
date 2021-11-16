import 'dart:convert';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
// import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streambeats_hero/game/note.dart';
import 'package:streambeats_hero/game/notes_manager.dart';

class StreambeatsHeroGame extends FlameGame with HasTappableComponents {
  static const int squareSpeed = 400;
  static final squarePaint = BasicPalette.white.paint();
  late Rect squarePos;
  int squareDirection = 1;
  int numOfLanes = 2;
  final String songPath;

  StreambeatsHeroGame(this.songPath);

  @override
  Color backgroundColor() {
    return Colors.grey.shade200;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    var songDataPath = this.songPath + '.json';
    var data = await rootBundle.loadString('assets/music_data/$songDataPath');
    var musicJSON = json.decode(data);

    final sprite = await Sprite.load("StreamBeatsNote.png");
    final halfW = canvasSize.x / 2;

    var _drumsManager = NotesManager(
      musicJSON['drum_tempo'],
      musicJSON['drum_beats'],
      Vector2(
        halfW - Note.initSize.x,
        0,
      ),
      Vector2(
        halfW / 2,
        canvasSize.y + Note.initSize.y * NotesManager.scaleFactor,
      ),
      sprite,
    );

    var _otherManager = NotesManager(
      musicJSON['other_tempo'],
      musicJSON['other_beats'],
      Vector2(
        halfW + Note.initSize.x,
        0,
      ),
      Vector2(
        halfW * 1.5,
        canvasSize.y + Note.initSize.y * NotesManager.scaleFactor,
      ),
      sprite,
    );

    add(_drumsManager);
    add(_otherManager);
    // FlameAudio.bgm.play('audio/edm/Dansu/11. Finding My way.wav');
    // FlameAudio.playLongAudio('music.mp3');
  }

  // @override
  // void onDetach() {
  //   super.onDetach();
  //   FlameAudio.bgm.stop();
  // }
}
