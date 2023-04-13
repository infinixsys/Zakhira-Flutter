import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/ShortsScreen/full_shorts_screen.dart';
import 'package:zakira/View/ShortsScreen/short_video_player.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              6,
              (index) => Column(
                    children: [
                      const SizedBox(
                        height: 18.0,
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "https://imageio.forbes.com/specials-images/imageserve/621907c6a1c1d351180dadb8/Buck-Mason-Dry-Waxed-Canvas-N1-Deck-Jacket-10/960x0.jpg?format=jpg&width=960"),
                        ),
                        title: const Text(
                          "Unique Tranding Clothes",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                            "Let your fashion escapades, trendsetting antics, and OOTD (outfit of the day) photos be known. Show the world your impeccable style."),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FullScreenShorts(),
                              ));
                        },
                        child: Container(
                          width: Utils().getScreenSize().width,
                          height: Utils().getScreenSize().height * 0.55,
                          color: Colors.grey,
                          child: const ShortsVideoPlayer(videoUrl: ""),
                        ),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      const Divider()
                    ],
                  ))
        ],
      ),
    );
  }
}
