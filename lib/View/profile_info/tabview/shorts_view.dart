import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/ShortsScreen/full_shorts_screen.dart';

class ShortsViewScrenn extends StatefulWidget {
  const ShortsViewScrenn({super.key});

  @override
  State<ShortsViewScrenn> createState() => _ShortsViewScrennState();
}

class _ShortsViewScrennState extends State<ShortsViewScrenn> {
  final double itemHeight =
      (Utils().getScreenSize().height - kToolbarHeight - 30) / 2;
  final double itemWidth = Utils().getScreenSize().width / 2;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            crossAxisSpacing: 8,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(10.0),
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: (itemWidth / itemHeight),
            children: [
              ...List.generate(
                  12,
                  (index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FullScreenShorts(),
                              ));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://moviegalleri.net/wp-content/gallery/kgf2-images/KGF2-4bb8356.jpg")),
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const[
                                Icon(
                                  Icons.play_arrow_outlined,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ))
            ],
          ),
        ],
      ),
    );
  }
}
