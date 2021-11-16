import 'package:flutter/material.dart';
import 'package:streambeats_hero/game/game.dart';
import 'package:streambeats_hero/overlays/pause_button.dart';

class PauseMenu extends StatelessWidget {
  static const String ID = 'PauseMenu';
  final StreambeatsHeroGame gameRef;
  const PauseMenu(this.gameRef);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.play_circle, size: 75.0),
        onPressed: () {
          gameRef.paused = false;
          gameRef.overlays.remove(ID);
          gameRef.overlays.add(PauseButton.ID);
        },
      ),
    );
  }
}
