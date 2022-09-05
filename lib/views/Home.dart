import 'dart:io';
import 'dart:typed_data';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audiotagger/models/audiofile.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:musicplayer/views/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'tabs.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audiotagger/audiotagger.dart';

final player = AudioPlayer();
final tagger = Audiotagger();

Future<Uint8List?> getart(String path) async {
  final albumart = await tagger.readArtwork(path: path);
  return albumart;
}

Future<AudioFile?> getaudiofile(String path) async {
  final audio_file = await tagger.readAudioFile(path: path);
  return audio_file;
}

void permissionhendler() async {
  const permission = Permission.storage;
  final statue = permission.status;
  if (statue != PermissionStatus.granted) {
    await permission.request();
    if (!await permission.status.isGranted) {
      exit(1);
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _getStoragePermission();
    super.initState();
  }

  bool permissionGranted = false;
  Future _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted = true;
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        permissionGranted = false;
        exit(1);
      });
    }
  }

  int pageIndex = 0;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: pages[pageIndex],
      ),
      bottomNavigationBar: Container(
        height: 85,
        color: const Color.fromRGBO(234, 235, 243, 1.0),
        child: Container(
          height: 85,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 0.5),
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Color.fromRGBO(234, 235, 243, 1.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const Icon(Iconic.home,
                          color: Color.fromRGBO(149, 90, 185, 1))
                      : const Icon(
                          Iconic.home,
                          color: Color.fromARGB(255, 143, 146, 146),
                        ),
                ),
                Text('Home',
                    style: TextStyle(
                        color: pageIndex == 0
                            ? const Color.fromRGBO(149, 90, 185, 1)
                            : const Color.fromARGB(255, 143, 146, 146)))
              ]),
              Column(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? const Icon(Icons.music_note,
                          size: 30, color: Color.fromRGBO(149, 90, 185, 1))
                      : const Icon(
                          Icons.music_note,
                          size: 30,
                          color: Color.fromARGB(255, 143, 146, 146),
                        ),
                ),
                Text('Songs',
                    style: TextStyle(
                        color: pageIndex == 2
                            ? const Color.fromRGBO(149, 90, 185, 1)
                            : const Color.fromARGB(255, 143, 146, 146)))
              ]),
              Column(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? const Icon(WebSymbols.search,
                          color: Color.fromRGBO(149, 90, 185, 1))
                      : const Icon(
                          WebSymbols.search,
                          color: Color.fromARGB(255, 143, 146, 146),
                        ),
                ),
                Text('Search',
                    style: TextStyle(
                        color: pageIndex == 1
                            ? const Color.fromRGBO(149, 90, 185, 1)
                            : const Color.fromARGB(255, 143, 146, 146)))
              ]),
              Column(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? const Icon(WebSymbols.youtube,
                          color: Color.fromRGBO(149, 90, 185, 1))
                      : const Icon(
                          WebSymbols.youtube,
                          color: Color.fromARGB(255, 143, 146, 146),
                        ),
                ),
                Text('Vanced',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: pageIndex == 3
                            ? const Color.fromRGBO(149, 90, 185, 1)
                            : const Color.fromARGB(255, 143, 146, 146)))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
