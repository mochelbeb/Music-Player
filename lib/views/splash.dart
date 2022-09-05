import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/views/fonctions.dart';
import 'Home.dart';

List<String> assetsimage = [
  './lib/assets/images/image1.jpg',
  './lib/assets/images/image2.jpg',
  './lib/assets/images/image3.jpg',
  './lib/assets/images/image4.jpg'
];
String image = '';

int number = 0;

List songs = [];
List artist = [];
List<String> album = [];
Uint8List? artworkart;
List<Uint8List?> artwork = [];

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _getPermission();
    songs = getSongs();
    artist = getArtist(songs);
    album = getAlbum(songs);
    getartwordk(songs);
    super.initState();
    _navigateTohome();
  }

  bool permissionGranted_state = false;
  Future _getPermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted_state = true;
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        permissionGranted_state = false;
        exit(1);
      });
    }
  }

  _navigateTohome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    number = Random().nextInt(4);
    image = assetsimage[number];
    precacheImage(AssetImage(image), context);
    for (Uint8List? code in artwork) {
      if (code != null) {
        precacheImage(MemoryImage(code), context);
      }
    }
    return Stack(
      children: <Widget>[
        // ignore: sized_box_for_whitespace
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "./lib/assets/images/splash.jpeg",
            fit: BoxFit.fill,
          ),
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ColoredBox(color: Colors.black54.withOpacity(0.5)),
        ),
        Positioned(
            top: 600,
            left: 25,
            child: RichText(
                text: TextSpan(
                    text: "MUSIC PLAYER",
                    style: GoogleFonts.ubuntu(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.0001)))),
        Positioned(
            top: 675,
            left: 25,
            child: RichText(
              text: TextSpan(
                  style: GoogleFonts.cairo(fontSize: 25.0, color: Colors.grey),
                  text: 'let music flow in your heart and'),
            )),
        Positioned(
            top: 705,
            left: 25,
            child: RichText(
              text: TextSpan(
                  style: GoogleFonts.cairo(fontSize: 25.0, color: Colors.grey),
                  text: 'enrich your soul!'),
            )),
        Positioned(
            top: 760,
            left: 25,
            child: RichText(
              text: TextSpan(
                  text: 'JUST A MINUTE',
                  style: GoogleFonts.oswald(
                      fontWeight: FontWeight.w400,
                      fontSize: 28.0,
                      color: Colors.white)),
            )),
        Positioned(
            top: 750,
            left: 165.0,
            child: SizedBox(
                height: 80.0,
                width: 100.0,
                child: Lottie.asset("./lib/assets/images/loading.json")))
      ],
    );
  }
}
