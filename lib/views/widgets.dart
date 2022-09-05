import 'dart:io';
import 'dart:typed_data';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/views/Home.dart';
import 'package:musicplayer/views/fonctions.dart';
import 'package:musicplayer/views/splash.dart';

import '../pages/song.dart';

int dur_of_song = 0;

class NewplayListBox extends StatelessWidget {
  const NewplayListBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 145,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 145,
                height: 145,
                margin: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.plus,
                          size: 50.0,
                          color: Colors.black87,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "New Playlist",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                    onPressed: () {
                      newplayListDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      primary: const Color.fromRGBO(234, 235, 243, 1),
                    ))),
          ],
        ));
  }

  newplayListDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("New Playlist"),
              content: Form(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'PlayList Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Empties not allowed';
                      } else if (value.trim().isEmpty) {
                        return 'Empty is not allowed';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel")),
                TextButton(onPressed: () {}, child: const Text("Create")),
              ]);
        });
  }
}

class NewRecentlyPlayed extends StatelessWidget {
  const NewRecentlyPlayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(234, 235, 243, 1),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(234, 235, 243, 1),
            elevation: 10,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(44, 62, 80, 1.0),
              ),
              child: const Icon(
                Icons.music_note,
                color: Colors.white,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Music Title name...",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Song Artist Name',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                )
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.black87,
                size: 20,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class SongInformation extends StatelessWidget {
  //(FileSystemEntity song, String artist, int index)
  final FileSystemEntity song;
  final int index;
  SongInformation({
    required this.song,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool imageExist = false;
    bool artExist = false;
    if (artwork[index] != null) {
      imageExist = true;
    }
    if (artist[index] != "null") {
      artExist = true;
    }
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(234, 235, 243, 1),
            elevation: 0.0,
            shadowColor: Colors.black,
          ),
          onPressed: () {
            player.setUrl(songs[index].path);
            player.play();
            player.durationStream.listen((event) {
              if (event != null) dur_of_song = event.inSeconds;
            });
            Navigator.of(context).push(_createSongPage(index, song));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  child: imageExist ? null : const Icon(FontAwesomeIcons.music),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0.0, 1.5),
                            blurRadius: 2)
                      ],
                      color: imageExist ? null : Colors.purple,
                      image: imageExist
                          ? DecorationImage(
                              image: MemoryImage(artwork[index] as Uint8List),
                              fit: BoxFit.fill)
                          : null,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)))),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      song
                              .toString()
                              .split('/')
                              .last
                              .characters
                              .take(42)
                              .toString() +
                          '...',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Unknown Artist",
                      style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    player.stop();
                  },
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ))
            ],
          )),
    );
  }
}

Route _createSongPage(int index, FileSystemEntity song) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SongPage(
            index: index,
            song: song,
          ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

class DurationState {
  final Duration? progress;
  final Duration? buffered;
  final Duration? total;
  const DurationState({this.progress, this.buffered, this.total});
}
