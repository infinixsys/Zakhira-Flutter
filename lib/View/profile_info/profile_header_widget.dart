import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:zakira/Models/profile_model.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/profile_info/user_details.dart';
import 'package:zakira/View/profile_info/edit_profile.dart';
import 'package:zakira/View/startsellingonzakira/start_selling_on_zakira.dart';
import 'package:zakira/store/store_view.dart';

class ProfileHeaderWidget extends StatefulWidget {
  final String name;
  final String shopeName;
  final String phoneNumber;
  final String email;
  final String img;
  ProfileHeaderWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.shopeName,
      required this.img});

  @override
  State<ProfileHeaderWidget> createState() => _SliverBarItemsState();
}

class _SliverBarItemsState extends State<ProfileHeaderWidget> {
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
              CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff74EDED),
                backgroundImage: NetworkImage(widget.img),
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
            child: UserDetailsView(
              name: widget.name,
              email: widget.email,
              phoneNumber: widget.phoneNumber,
              shopeName: widget.shopeName,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StartSellingOnZakira(),
                    ));
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  side: BorderSide(color: Colors.white)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Text("Ragister as verified seller",
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: actions(
              context,
            ),
          ),
        ]));
  }

  Widget actions(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size(0, 30),
                backgroundColor: Colors.grey[300],
                side: BorderSide(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      name: widget.name,
                      email: widget.email,
                      phone: widget.phoneNumber,
                      img: widget.img,
                    ),
                  ));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:
                  Text("Edit Profile", style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size(0, 30),
                backgroundColor: Colors.orange[300],
                side: const BorderSide(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StoreView(),
                  ));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text("Visit Store", style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
}
