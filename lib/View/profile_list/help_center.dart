import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/profile_list/helpcenter/all_topics.dart';

import 'package:zakira/View/profile_list/setting/setting_page.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Help Center", style: GoogleFonts.poppins()),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 3,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            width: Utils().getScreenSize().width,
                            height: Utils().getScreenSize().height * 0.25,
                            decoration: BoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.book_online_rounded,
                                          size: 40,
                                          color: orangeColor,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Upload tax information")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.security,
                                          size: 40,
                                          color: orangeColor,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Card Security Check")
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.book_online_rounded,
                                          size: 40,
                                          color: orangeColor,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Track my parcel")
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.security,
                                          size: 40,
                                          color: orangeColor,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Track my refund")
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Order related issues",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            getSettingListTile(Text("Order Status & Delivery"),
                                Icon(Icons.arrow_forward_ios_rounded), () {}),
                            Divider(
                              color: Colors.grey,
                            ),
                            getSettingListTile(Text("Refund & Payment"),
                                Icon(Icons.arrow_forward_ios_rounded), () {}),
                            Divider(
                              color: Colors.grey,
                            ),
                            getSettingListTile(Text("Return & Exchange"),
                                Icon(Icons.arrow_forward_ios_rounded), () {}),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BrowseAllHotTopics(),
                              ));
                        },
                        child: ListTile(
                          title: Text(
                            "Browse all hot topics",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          subtitle: Text(
                              "Reselling,account related,refer & earn etc."),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: getCustomizedButton(
                    Utils().getScreenSize().width * 0.9,
                    Utils().getScreenSize().height * 0.06,
                    Text(
                      "Live Chat",
                      style: TextStyle(color: Colors.white),
                    ),
                    orangeColor,
                    Border()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
