import 'package:flutter/material.dart';
import 'package:streambeats_hero/screens/game_play.dart';

class SongPicker extends StatelessWidget {
  final String genre;
  final List<dynamic> songs;
  SongPicker(this.genre, this.songs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pick a Song')),
        body: ListView(
          children: songs
              .map((entry) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GamePlay(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: new BoxDecoration(
                          border: Border.all(
                        color: Colors.grey,
                      )),
                      child: Center(child: Text(entry['song'])),
                    ),
                  ))
              .toList(),
        ));
  }
}
