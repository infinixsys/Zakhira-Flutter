import 'package:flutter/material.dart';
import 'package:zakira/Models/profile_model.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/profile_info/user_details.dart';
import 'package:zakira/View/profile_info/edit_profile.dart';
import 'package:zakira/View/startsellingonzakira/start_selling_on_zakira.dart';
import 'package:zakira/store/store_view.dart';

class ProfleItems extends StatefulWidget {

   const ProfleItems({super.key});

  @override
  State<ProfleItems> createState() => _SliverBarItemsState();
}

class _SliverBarItemsState extends State<ProfleItems> {
  String temp = "";
  String tempe = "";
  String temps = "";
  String tempd = "";
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: Utils().getScreenSize().height * 0.4,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff74EDED),
                backgroundImage: NetworkImage(
                    "https://imageio.forbes.com/specials-images/imageserve/621907c6a1c1d351180dadb8/Buck-Mason-Dry-Waxed-Canvas-N1-Deck-Jacket-10/960x0.jpg?format=jpg&width=960"),
              ),
              Row(children: [
                Column(
                  children: const [
                    Text(
                      "23",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Posts",
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.4,
                      ),
                    )
                  ],
                ),
              ]),
              Column(
                children: const [
                  Text(
                    "1.5M",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Followers",
                    style: TextStyle(
                      letterSpacing: 0.4,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Column(
                children: const [
                  Text(
                    "1.5M",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Following",
                    style: TextStyle(
                      letterSpacing: 0.4,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ],
          ),
           Padding(
            padding: EdgeInsets.only(top: 8.0, left: 20.0),
            child: UserDetailsView(name: temp,email: "",phoneNumber: "", shopeName: "", ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {
              
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: orangeColor,
                  side: const BorderSide(color: Colors.white)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text("Follow", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StoreView(),
                    ));
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  side: BorderSide(color: Colors.white)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Text("Visit Store", style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
        ]));
  }
}
