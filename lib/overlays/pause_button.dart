import 'package:flutter/material.dart';
import 'package:streambeats_hero/game/game.dart';
import 'package:streambeats_hero/overlays/pause_menu.dart';

class PauseButton extends StatelessWidget {
  static const String ID = 'PauseButton';

  final StreambeatsHeroGame gameRef;
  PauseButton(this.gameRef);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 25),
          child: IconButton(
            icon: Icon(Icons.pause_circle, size: 35.0),
            onPressed: () {
              gameRef.paused = true;
              gameRef.overlays.remove(ID);
              gameRef.overlays.add(PauseMenu.ID);
            },
          ),
        ));
  }
}
