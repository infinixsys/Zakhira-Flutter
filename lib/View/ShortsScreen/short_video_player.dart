import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortsVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const ShortsVideoPlayer({super.key, required this.videoUrl});

  @override
  State<ShortsVideoPlayer> createState() => _ShortsVideoPlayerState();
}

class _ShortsVideoPlayerState extends State<ShortsVideoPlayer> {
  final asset = "assets/kgf.mp4";

  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.asset(asset)
      ..addListener(() {
        setState(() {});
      })
      
      ..pause()
      ..setVolume(0.0)
      ..initialize().then((value) => videoPlayerController.play(
        
      ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.black,
       
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
