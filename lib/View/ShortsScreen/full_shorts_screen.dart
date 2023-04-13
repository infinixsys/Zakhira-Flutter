import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/ShortsScreen/comments_screen.dart';
import 'package:zakira/View/ShortsScreen/profile_bottomsheet.dart';
import 'package:zakira/View/ShortsScreen/short_video_player.dart';
import 'package:zakira/View/chat%20screen/chat_screen_page.dart';

class FullScreenShorts extends StatefulWidget {
  const FullScreenShorts({super.key});

  @override
  State<FullScreenShorts> createState() => _FullScreenShortsState();
}

class _FullScreenShortsState extends State<FullScreenShorts> {
  bool isLikeTap = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: PageView(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            children: [
              ...List.generate(
                  6,
                  (index) => SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            const ShortsVideoPlayer(videoUrl: ""),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 10, left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      scaffoldKey.currentState?.showBottomSheet(
                                          (context) =>
                                              const ProfileBottomSheet());
                                    },
                                    child: ListTile(
                                        leading: const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://imageio.forbes.com/specials-images/imageserve/621907c6a1c1d351180dadb8/Buck-Mason-Dry-Waxed-Canvas-N1-Deck-Jacket-10/960x0.jpg?format=jpg&width=960"),
                                        ),
                                        title: Row(
                                          children: [
                                            const Text(
                                              "@UserName",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            getCustomizedButton(
                                                Utils().getScreenSize().width *
                                                    0.18,
                                                Utils().getScreenSize().height *
                                                    0.03,
                                                const Text(
                                                  "Follow",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                                Colors.pink,
                                                Border.all(color: Colors.pink))
                                          ],
                                        )),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "My Caption Is Here",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Song",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              padding: EdgeInsets.only(
                                  top: Utils().getScreenSize().height * 0.3),
                              alignment: Alignment.bottomRight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Icon(
                                    CupertinoIcons.heart_fill,
                                    color: Colors.pink,
                                    size: 35,
                                  ),
                                  const Text(
                                    "328.7k",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      scaffoldKey.currentState?.showBottomSheet(
                                          (context) => const CommentScreen());
                                    },
                                    icon: const Icon(Icons.comment,
                                        color: Colors.white, size: 35),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ChatScreenPage(),
                                            ));
                                      },
                                      child: Image.asset(
                                        "assets/share.png",
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
            ],
          ),
        ));
  }
}
