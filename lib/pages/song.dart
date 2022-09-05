import 'package:volume/volume.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicplayer/views/Home.dart';
import 'package:musicplayer/views/splash.dart';
import 'package:rxdart/rxdart.dart';

import '../views/widgets.dart';

class SongPage extends StatefulWidget {
  const SongPage({
    Key? key,
    required this.index,
    required this.song,
  }) : super(key: key);
  final int index;
  final FileSystemEntity song;
  @override
  State<SongPage> createState() => _SongPageState(index: index, song: song);
}

class _SongPageState extends State<SongPage> {
  int index;
  FileSystemEntity song;
  _SongPageState({required this.index, required this.song});

  bool icon_pressed = true;
  bool image_exist = false;
  bool icon_play = true;
  bool artist_exist = false;

  String _artist = "";
  Duration duration = Duration.zero;
  double dur = Duration.zero.inSeconds.toDouble();

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    image_exist = false;
    double value = 10.0;
    if (artwork[index] != null) {
      image_exist = true;
    }
    if (artist[index] != "null") {
      artist_exist = true;
      _artist = artist[index];
    }
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            toolbarHeight: 100,
            elevation: 0.0,
            backgroundColor: const Color.fromRGBO(234, 235, 243, 1),
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: const Color.fromRGBO(234, 235, 243, 1),
                        elevation: 6.0,
                        shadowColor: Colors.black,
                        fixedSize: const Size(10, 50)),
                    onPressed: () {
                      Navigator.pop(context);
                      player.stop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                    )),
                const Text("Song", style: TextStyle(color: Colors.black)),
                ElevatedButton(
                  onPressed: () {
                    try {
                      // your code that you want this IconButton do
                      setState(() {
                        icon_pressed = !icon_pressed;
                        print(icon_pressed);
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Icon(
                    icon_pressed
                        ? FontAwesomeIcons.heart
                        : FontAwesomeIcons.solidHeart,
                    color: Colors.red,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      primary: const Color.fromRGBO(234, 235, 243, 1),
                      elevation: 6.0,
                      shadowColor: Colors.black,
                      fixedSize: const Size(10, 50)),
                )
              ],
            ),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          color: const Color.fromRGBO(234, 235, 243, 1),
          child: Stack(
            children: [
              Positioned(
                top: 30,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(234, 235, 243, 1),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0,
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(0.0, -0.5),
                            blurRadius: 10.0)
                      ],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Listening to",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 24),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: width - 200,
                        width: width - 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 6.0,
                                spreadRadius: 5.0,
                                offset: Offset(1.0, 1.0))
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: image_exist ? null : Colors.purple,
                          image: image_exist
                              ? DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      MemoryImage(artwork[index] as Uint8List))
                              : null,
                        ),
                        child: image_exist
                            ? null
                            : Icon(
                                FontAwesomeIcons.music,
                                size: 40,
                                color: Colors.white,
                              ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RichText(
                          text: TextSpan(
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                              text: songs[index]
                                      .path
                                      .toString()
                                      .split('/')
                                      .last
                                      .characters
                                      .take(33)
                                      .toString() +
                                  "...")),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          artist_exist
                              ? artist[index].toString()
                              : "Unknown Artist",
                          style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 15)),
                      Container(
                        width: width - 200,
                        child: StreamBuilder<PositionData>(
                          stream: _positionDataStream,
                          builder: (context, snapshot) {
                            final positiondata = snapshot.data;
                            return ProgressBar(
                              progress: positiondata?.position ?? Duration.zero,
                              total: positiondata?.duration ?? Duration.zero,
                              onSeek: (duration_new) {
                                player.seek(duration_new);
                              },
                              progressBarColor: Colors.purple,
                              thumbColor: Colors.purple,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: width - 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                iconSize: 30,
                                onPressed: () {},
                                icon: Icon(Icons.volume_up)),
                            IconButton(
                                iconSize: 30,
                                onPressed: () {
                                  index -= 1;
                                  player.setUrl(songs[index].path);
                                  setState(() {
                                    SongPage(
                                      song: songs[index],
                                      index: index,
                                    );
                                  });
                                },
                                icon: Icon(Icons.arrow_back)),
                            IconButton(
                                iconSize: 30,
                                onPressed: () {
                                  if (icon_play)
                                    player.pause();
                                  else
                                    player.play();
                                  setState(() {
                                    icon_play = !icon_play;
                                  });
                                },
                                icon: Icon(!icon_play
                                    ? Icons.play_arrow
                                    : Icons.pause)),
                            IconButton(
                                iconSize: 30,
                                onPressed: () {
                                  index += 1;
                                  player.setUrl(songs[index].path);
                                  setState(() {
                                    SongPage(
                                      song: songs[index],
                                      index: index,
                                    );
                                  });
                                },
                                icon: Icon(Icons.arrow_forward)),
                            IconButton(
                                iconSize: 30,
                                onPressed: () {},
                                icon: Icon(Icons.list)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
