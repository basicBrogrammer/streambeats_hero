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
  final String songPath;
  bool debugMode = true;

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

    _addNoteManager(
      sprite,
      musicJSON['drum_tempo'],
      musicJSON['drum_beats'],
      halfW - Note.initSize.x,
      halfW / 2,
    );
    _addNoteManager(
      sprite,
      musicJSON['other_tempo'],
      musicJSON['other_beats'],
      halfW + Note.initSize.x,
      halfW * 1.5,
    );

    // FlameAudio.bgm.play('audio/edm/Dansu/11. Finding My way.wav');
    // FlameAudio.playLongAudio('music.mp3');
    add(PolygonComponent.fromDefinition(
      [
        Vector2(-.97, -1),
        Vector2(-1, -.95),
        Vector2(-1, .95),
        Vector2(-.97, 1),
        Vector2(.97, 1),
        Vector2(1, .95),
        Vector2(1, -.95),
        Vector2(.97, -1),
      ],
      size: Vector2(canvasSize.x * .95, Note.finalSize.y * 1.05),
      paint: Paint()..color = Colors.white,
      position: goalPosition,
    ));
  }

  // @override
  // void onDetach() {
  //   super.onDetach();
  //   FlameAudio.bgm.stop();
  // }

  void _addNoteManager(
    Sprite sprite,
    double bpm,
    List<dynamic> beats,
    double startX,
    double endX,
  ) {
    var _manager = NotesManager(
      bpm,
      beats,
      Vector2(
        startX,
        0,
      ),
      Vector2(
        endX,
        canvasSize.y + Note.initSize.y * NotesManager.scaleFactor,
      ),
      sprite,
    );

    add(_manager);
  }

  Vector2 get goalPosition {
    return Vector2(canvasSize.x / 2, canvasSize.y - 1.5 * Note.finalSize.y);
  }
}
