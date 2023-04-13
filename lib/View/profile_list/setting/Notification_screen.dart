import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/profile_list/setting/setting_page.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isAddNotificationToolbar = true;
  bool isChatMessages = true;
  bool isPromotions = true;
  bool isPayLater = true;
  bool isOrders = true;
  bool isFeeds = true;
 
  bool isAlertSound = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Notification Settings", style: GoogleFonts.poppins()),
      ),
      body: Column(
        children: [
          getNotificationTile(
            Text("Add to Notification Toolbar"),
            Switch(
              value: this.isAddNotificationToolbar,
              onChanged: (bool value) {
                setState(() {
                  this.isAddNotificationToolbar = value;
                });
              },
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          getNotificationTile(
              Text(
                "General",
                style: TextStyle(color: orangeColor),
              ),
              Text("")),
          getNotificationTile(
            Text("Chat Messages"),
            Switch(
              value: this.isChatMessages,
              onChanged: (bool value) {
                setState(() {
                  this.isChatMessages = value;
                });
              },
            ),
          ),
          getNotificationTile(
            Text("Promotions"),
            Switch(
              value: this.isPromotions,
              onChanged: (bool value) {
                setState(() {
                  this.isPromotions = value;
                });
              },
            ),
          ),
        
          getNotificationTile(
            Text("Orders"),
            Switch(
              value: this.isOrders,
              onChanged: (bool value) {
                setState(() {
                  this.isOrders = value;
                });
              },
            ),
          ),
          getNotificationTile(
            Text("Feeds"),
            Switch(
              value: this.isFeeds,
              onChanged: (bool value) {
                setState(() {
                  this.isFeeds = value;
                });
              },
            ),
          ),
        
          Divider(
            color: Colors.grey,
          ),
          getNotificationTile(
              Text(
                "Advanced",
                style: TextStyle(color: orangeColor),
              ),
              Text("")),
          getNotificationTile(
            Text("Alert Sound"),
            Switch(
              value: this.isAlertSound,
              onChanged: (bool value) {
                setState(() {
                  this.isAlertSound = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget getNotificationTile(Text mytitle, Widget widget) {
  return ListTile(
    title: mytitle,
    trailing: widget,
  );
}
