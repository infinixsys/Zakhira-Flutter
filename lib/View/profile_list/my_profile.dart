import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: orangeColor),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("My Profile", style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                  child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://imageio.forbes.com/specials-images/imageserve/621907c6a1c1d351180dadb8/Buck-Mason-Dry-Waxed-Canvas-N1-Deck-Jacket-10/960x0.jpg?format=jpg&width=960",
                    ),
                    minRadius: 40,
                    maxRadius: 50,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: Utils().getScreenSize().width * 0.08,
                        height: Utils().getScreenSize().height * 0.04,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(55)),
                        child: Center(
                            child: Icon(Icons.photo_camera, color: orangeColor)),
                      ),
                    ),
                  )
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "Basic Information",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 1,
              child: Column(
                children: [
                  getCustomRow(
                      "Name",
                      Text(
                        "Rick Flare",
                        style: TextStyle(fontSize: 15),
                      ),
                      () {}),
                  Divider(
                    color: Colors.grey,
                  ),
                  getCustomRow(
                      "Company information",
                      Text(
                        "noCompany",
                        style: TextStyle(fontSize: 15),
                      ),
                      () {}),
                  Divider(
                    color: Colors.grey,
                  ),
                  getCustomRow(
                      "Email",
                      Text(
                        "rickflare1234@gmail.com",
                        style: TextStyle(fontSize: 15),
                      ),
                      () {}),
                  Divider(
                    color: Colors.grey,
                  ),
                  getCustomRow(
                      "Mobile",
                      Text(
                        "incomplete",
                        style: TextStyle(fontSize: 15),
                      ),
                      () {}),
                  Divider(
                    color: Colors.grey,
                  ),
                  getCustomRow("Tax Information", Text(""), () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "Sourcing Information",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 1,
              child: Column(
                children: [
                  getCustomRow(
                      "Purchasing frequancy",
                      Text(
                        "Incomplete",
                        style: TextStyle(fontSize: 15),
                      ),
                      () {}),
                  Divider(
                    color: Colors.grey,
                  ),
                  getCustomRow(
                      "Sourcing prefrence",
                      Text(
                        "Both",
                        style: TextStyle(fontSize: 15),
                      ),
                      () {}),
                  Divider(
                    color: Colors.grey,
                  ),
                  getCustomRow(
                      "Anual pucrchasing amount",
                      Text(
                        "Incomplete",
                        style: TextStyle(fontSize: 15),
                      ),
                      () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getCustomRow(String mytext, Text text, onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            mytext,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              text,
              IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
