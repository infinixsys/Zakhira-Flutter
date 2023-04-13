import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/ShortsScreen/full_shorts_screen.dart';
import 'package:zakira/View/ShortsScreen/short_video_player.dart';

class AllVideosScreen extends StatefulWidget {
  const AllVideosScreen({super.key});

  @override
  State<AllVideosScreen> createState() => _AllVideosScreenState();
}

class _AllVideosScreenState extends State<AllVideosScreen> {
  final double itemHeight =
      (Utils().getScreenSize().height - kToolbarHeight - 30) / 2;
  final double itemWidth = Utils().getScreenSize().width / 2;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 14.0, bottom: 10.0,top: 10.0),
                child: Text(
                  "Just For You",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              GridView.count(
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 0,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                children: [
                  ...List.generate(
                      10,
                      (index) => Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullScreenShorts(),
                                    ));
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            Utils().getScreenSize().width * 0.45,
                                        height:
                                            Utils().getScreenSize().height * 0.30,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: ShortsVideoPlayer(videoUrl: ""),
                                      ),
                                      const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                      width: Utils().getScreenSize().width * 0.45,
                                      child: Text(
                                        "My best jackest collections only on Zakhira. ",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[700]),
                                      )),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundImage: NetworkImage(
                                            "https://imageio.forbes.com/specials-images/imageserve/621907c6a1c1d351180dadb8/Buck-Mason-Dry-Waxed-Canvas-N1-Deck-Jacket-10/960x0.jpg?format=jpg&width=960"),
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "Seller Name",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                ],
              )
            ],
          ),
    );
  }
}