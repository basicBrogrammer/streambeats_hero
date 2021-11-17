import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  static const String ID = 'GameOver';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Game Over.",
          style: TextStyle(fontSize: 30),
        ),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
