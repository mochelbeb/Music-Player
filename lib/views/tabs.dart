import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/views/splash.dart';
import 'package:musicplayer/views/widgets.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(234, 235, 243, 1.0)),
          child: Stack(children: <Widget>[
            Positioned(
                top: 55.0,
                left: 25.0,
                child: RichText(
                  text: TextSpan(
                      text: "Welcome back !",
                      style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(41, 41, 41, 1),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      )),
                )),
            Positioned(
                left: 25.0,
                top: 85.0,
                child: RichText(
                  text: TextSpan(
                      text: "Listen to your favorite music..",
                      style: GoogleFonts.poppins(
                          fontSize: 17.0,
                          letterSpacing: 0.5,
                          color: Colors.grey[600])),
                )),
            Positioned(
                top: 56,
                right: 37.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(234, 235, 243, 1),
                    elevation: 15,
                    shadowColor: Colors.black,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.black,
                  ),
                )),
            /* Positioned(
                top: 45.0,
                right: 13.5,
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.settings,
                    size: 40,
                    color: Color.fromRGBO(242, 242, 242, 1.0),
                  ),
                )), */
            Positioned(
                top: 160.0,
                left: 25.0,
                right: 25.0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(17, 10, 0, 0),
                  child: Stack(children: <Widget>[
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Your',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' Weekly Music',
                            style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(51, 51, 51, 1.0),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold))
                      ]),
                    ),
                    Positioned(
                        top: 35.0,
                        child: RichText(
                            text: TextSpan(
                                text: 'Mix',
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(51, 51, 51, 1.0),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                )))),
                    const Positioned(
                        top: 40.0,
                        left: 50,
                        child: FaIcon(
                          FontAwesomeIcons.music,
                          color: Color.fromRGBO(51, 51, 51, 1.0),
                        )),
                    Positioned(
                        top: 82.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(234, 235, 243, 1),
                              shadowColor: Colors.black,
                              elevation: 20,
                              fixedSize: const Size(30, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.all(5)),
                          onPressed: () {},
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            size: 40,
                            color: Colors.black,
                          ),
                        )),
                  ]),
                  height: 165.0,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0)
                    ],
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("./lib/assets/images/grey.jpg")),
                    borderRadius: BorderRadius.circular(16),
                  ),
                )),
            Positioned(
                top: 125,
                right: 10,
                child: Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('./lib/assets/images/girl.png'),
                            fit: BoxFit.fill)))),
            Positioned(
                left: 25.0,
                top: 360,
                child: Text("Playlists",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ))),
            // Positioned(
            // top: 400,
            // left: 24.0,
            // child: NewplayListBox(),
            //)
            Positioned(
                top: 385,
                left: 20,
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    NewplayListBox(),
                    SizedBox(
                      width: 30,
                    ),
                    // NewplayListBox(),
                    // SizedBox(
                    //   width: 30,
                    // ),
                    // NewplayListBox(),
                    // SizedBox(
                    //   width: 30,
                    // ),
                    // NewplayListBox(),
                    // SizedBox(
                    //   width: 30,
                    // )
                  ],
                )),
            Positioned(
                top: 580,
                left: 25.0,
                child: Text(
                  "Recently Played",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none),
                )),
            Positioned(
                top: 635,
                left: 25,
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: const [
                    NewRecentlyPlayed(),
                    SizedBox(
                      height: 10.0,
                    ),
                    NewRecentlyPlayed(),
                    SizedBox(
                      height: 10.0,
                    ),
                    NewRecentlyPlayed(),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ))
          ])),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late List songlist = [];

  @override
  void initState() {
    songlist = songs.toList();
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromRGBO(234, 235, 243, 1.0)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 0.1),
                      blurRadius: 6.0,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Stack(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height / 5.5,
                    left: 10,
                    child: RichText(
                        text: TextSpan(
                            text: 'Hello ListenerX,',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.bold)))),
                Positioned(
                    top: MediaQuery.of(context).size.height / 4.7,
                    left: 10,
                    child: RichText(
                        text: TextSpan(
                            text: 'what you want to hear today?',
                            style: GoogleFonts.poppins(fontSize: 15)))),
              ]),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height / 3.5) - 35,
            right: 80,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                      offset: Offset(1.0, 2.0)),
                  BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 3.0,
                      offset: Offset(-1.0, -2.0))
                ],
                borderRadius: BorderRadius.circular(50),
                color: Color.fromRGBO(234, 235, 243, 1),
              ),
              height: 70,
              width: 70,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 40,
                  color: Colors.purple,
                ),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 3.1,
              left: 25,
              child: RichText(
                text: TextSpan(
                    text: "Music list",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87)),
              )),
          Positioned(
            top: 300,
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.purple.shade700,
              controller: _tabController,
              tabs: [
                Tab(
                    child: Text(
                  'Songs',
                  style: GoogleFonts.poppins(
                      color: Colors.purple.shade800,
                      fontWeight: FontWeight.bold),
                )),
                Tab(
                    child: Text(
                  'Artists',
                  style: GoogleFonts.poppins(
                      color: Colors.purple.shade800,
                      fontWeight: FontWeight.bold),
                )),
                Tab(
                    child: Text(
                  'Album',
                  style: GoogleFonts.poppins(
                      color: Colors.purple.shade800,
                      fontWeight: FontWeight.bold),
                )),
                Tab(
                    child: Text(
                  'Folders',
                  style: GoogleFonts.poppins(
                      color: Colors.purple.shade800,
                      fontWeight: FontWeight.bold),
                ))
              ],
            ),
          ),
          Positioned(
            top: 350,
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: songlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SongInformation(
                          song: songlist[index], index: index);
                    }),
                ListView.builder(
                    itemCount: artist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(artist[index].toString());
                    }),
                ListView.builder(
                    itemCount: album.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(album[index].toString());
                    }),
                const Text("data"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
