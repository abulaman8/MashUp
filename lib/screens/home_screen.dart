import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticktok_ui/utils/custom_scroll_physics.dart';
import 'package:video_player/video_player.dart';

import 'package:ticktok_ui/screens/message_screen.dart';
import 'package:ticktok_ui/screens/profile_screen.dart';
import 'package:ticktok_ui/screens/search_screen.dart';
import 'package:ticktok_ui/screens/video_screen.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:ticktok_ui/routes/routes.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlickManager? flickManager;
  List<Map> eventsData = [
    {
      "title": "Event ABC 1",
      "subTitle": "Organised by XYZ",
      "desc": "Event description.",
      "date": "13th Jan, 2022",
      "time": "4:00 pm",
      "lastDate": "11th Jan, 2022",
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
    },
    {
      "title": "Event MNT 2",
      "subTitle": "Organised by XYZ",
      "desc": "Event description.",
      "date": "13th Jan, 2022",
      "time": "4:00 pm",
      "lastDate": "11th Jan, 2022",
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    },
    {
      "title": "Event WOQ 3",
      "subTitle": "Organised by STU",
      "desc": "Event description.",
      "date": "13th Jan, 2022",
      "time": "4:00 pm",
      "lastDate": "11th Jan, 2022",
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
    }
  ];
  int pageIdx = 0;
  Widget _buildPages(int index) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    switch (index) {
      case 0:
        return VisibilityDetector(
            key: ObjectKey(flickManager),
            onVisibilityChanged: (visibility) {
              if (visibility.visibleFraction>0.0 &&this.mounted) {
                flickManager?.flickControlManager?.pause();
                //pausing  functionality
              }
            },
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: eventsData.length,
              physics: CustomPageViewScrollPhysics(),
              itemBuilder: (BuildContext context, int itemIndex) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      child: AspectRatio(
                        aspectRatio: 1280 / 720,
                        child: GestureDetector(
                          onTap: (){
                            if(flickManager!.flickVideoManager!.isPlaying){
                              flickManager!.flickControlManager!.pause();
                            }else{
                              flickManager!.flickControlManager!.play();
                            }
                          },
                          child: FlickVideoPlayer(
                            flickManager:flickManager= FlickManager(
                                videoPlayerController: VideoPlayerController.network(
                                    eventsData[itemIndex]['url'])),
                            flickVideoWithControls: FlickVideoWithControls(
                              videoFit: BoxFit.cover,
                            ),
                          ),
                        ),
                        /*VideoPlayer(
                                      video_controller
                                  ),*/
                      ),
                    ),

                    Positioned(
                      bottom: height * .01,
                      left: width * .02,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: width / height * 35,
                                backgroundColor: Colors.grey,
                              ),
                              const VerticalDivider(width: 5),
                              Text(
                                "@mr-robot",
                                style:
                                GoogleFonts.roboto(fontSize: 18, color: Colors.white),
                              ),
                              const VerticalDivider(width: 5),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    "Follow",
                                    style: GoogleFonts.aBeeZee(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.transparent,
                            height: height * 0.03,
                          ),
                          Row(
                            children: [
                              Text(
                                "#Avicii",
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                              const VerticalDivider(width: 5),
                              Text(
                                "#Wflove",
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pushNamed(routeName.AlbumScreen),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.music_note_rounded,
                                  color: Colors.white,
                                ),
                                const VerticalDivider(width: 5),
                                Text(
                                  eventsData[itemIndex]['title'],
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: height * .15,
                      right: width * .02,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 35,
                              )),
                          Text(
                            "353K",
                            style: GoogleFonts.roboto(fontSize: 10, color: Colors.white),
                          ),
                          Divider(height: height * .03),
                          IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    isDismissible: false,
                                    context: context,
                                    builder: (ctx) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BottamSheet(height: height, width: width),
                                      );
                                    });
                              },
                              icon: const Icon(
                                Icons.chat_bubble_rounded,
                                color: Colors.white,
                                size: 35,
                              )),
                          Text(
                            "578",
                            style: GoogleFonts.roboto(fontSize: 10, color: Colors.white),
                          ),
                          Divider(height: height * .03),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 35,
                              )),
                          Text(
                            "12",
                            style: GoogleFonts.roboto(fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],

                );
              },
            ));
        break;
      case 1:
        return SearchScreen();
        break;
      case 2:
        return Text("");
        break;
      case 3:
        return MessaegScreen();
        break;
      case 4:
        return ProfileScreen();
        break;
      default:
        return VideoScreen();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (idx) {
            flickManager!.flickControlManager!.pause();
            setState(() {
              pageIdx = idx;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          currentIndex: pageIdx,

          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.message, size: 30),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: '',
            ),
          ],
        ),
        body: _buildPages(pageIdx),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<FlickManager>('flickManager', flickManager));
  }
  @override
  void dispose() {
    flickManager!.flickControlManager!.pause();
    super.dispose();
  }
}
