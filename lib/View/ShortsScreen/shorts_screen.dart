import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/ShortsScreen/full_shorts_screen.dart';
import 'package:zakira/View/ShortsScreen/short_video_player.dart';
import 'package:zakira/View/ShortsScreen/shortscreenView/all_videos_screen.dart';
import 'package:zakira/View/ShortsScreen/shortscreenView/following_video_screen.dart';
import 'package:zakira/View/homeScreen/searchbar_field.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> with SingleTickerProviderStateMixin {
 late TabController _tabController;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Discover Top Sellers",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchBarScreen(),
                    ));
              },
              icon: const Icon(Icons.search)),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://imageio.forbes.com/specials-images/imageserve/621907c6a1c1d351180dadb8/Buck-Mason-Dry-Waxed-Canvas-N1-Deck-Jacket-10/960x0.jpg?format=jpg&width=960"),
            ),
          ),
        ],

        bottom: TabBar(
          labelPadding: EdgeInsets.only(right: 15),
          indicatorColor: Colors.black,
          indicatorWeight: 2.0,
          indicatorPadding: EdgeInsets.only(right: 14.0),
          labelStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Recommended",
            ),
            Tab(
              text: "Following",
            ),
           
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:const [
          AllVideosScreen(),
          FollowingScreen()
        ]) 
    
    );
  }
}
