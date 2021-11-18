import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:streambeats_hero/screens/main_menu.dart';

class GameOver extends StatelessWidget {
  static const String ID = 'GameOver';

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Container(
        color: Colors.black.withOpacity(0.2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 50.0,
                  horizontal: 50.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blueAccent,
                  ),
                ),
                child: Text(
                  'Game Over.',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        blurRadius: 20.0,
                        color: Colors.white,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: ElevatedButton(
                  onPressed: () {
                    // Push and replace current screen (i.e MainMenu) with
                    // SelectSpaceship(), so that player can select a spaceship.
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MainMenu(),
                      ),
                    );
                  },
                  child: Text('Restart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
