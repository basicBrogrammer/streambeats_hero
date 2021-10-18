import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:streambeats_hero/game/game.dart';

class GamePlay extends StatelessWidget {
  final String genre;
  final String album;
  final String song;
  const GamePlay(this.genre, this.album, this.song);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: StreambeatsHeroGame('$genre/$album/$song'),
      ),
    );
  }
}
