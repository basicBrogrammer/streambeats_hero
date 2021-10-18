import 'package:flutter/material.dart';
import 'package:streambeats_hero/screens/main_menu.dart';

void main() async {
  // var game = StreambeatsHeroGame();
  // runApp(GameWidget(game: game));
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.lightGreen,
      backgroundColor: Colors.greenAccent,
    ),
    home: MainMenu(),
  ));
}
