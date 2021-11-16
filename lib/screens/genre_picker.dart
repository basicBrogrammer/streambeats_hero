import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streambeats_hero/screens/song_picker.dart';

class GenrePicker extends StatefulWidget {
  const GenrePicker({Key? key}) : super(key: key);

  @override
  _GenrePickerState createState() => _GenrePickerState();
}

class _GenrePickerState extends State<GenrePicker> {
  Map<String, dynamic> musicData = {};

  @override
  void initState() {
    super.initState();
    _initMusicData(context);
  }

  Future _initMusicData(context) async {
    final String response =
        await rootBundle.loadString('assets/music_dictionary.json');
    final data = await json.decode(response);
    setState(() {
      musicData = data;
    });
  }

  List<Widget> _buildGrid() {
    return musicData.entries.map<Widget>((entry) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SongPicker(entry.key, entry.value),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Stack(children: [
            Image(
              image: AssetImage('assets/images/genre/edm.png'),
            ),
            Center(
              child: Text(
                "EDM",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 20.0,
                      color: Colors.black,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Genre'),
      ),
      body: Center(
          child: FutureBuilder(
        future: _initMusicData(context),
        builder: (context, snapshot) {
          if (musicData.isNotEmpty) {
            return GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: _buildGrid(),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
