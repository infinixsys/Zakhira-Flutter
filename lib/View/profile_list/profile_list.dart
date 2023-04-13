import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/profile_list/add_address_screen.dart';
import 'package:zakira/View/profile_list/app_feedback.dart';
import 'package:zakira/View/profile_list/buyer_central.dart';
import 'package:zakira/View/profile_list/manage_inventory.dart';
import 'package:zakira/View/profile_list/following_screens.dart';
import 'package:zakira/View/profile_list/help_center.dart';
import 'package:zakira/View/profile_list/my_favorites.dart';
import 'package:zakira/View/profile_list/myorder/myOrders_info.dart';
import 'package:zakira/View/profile_list/setting/setting_page.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          const SizedBox(
            height: 25.0,
          ),
          Center(
            child: Container(
              width: Utils().getScreenSize().width,
              height: Utils().getScreenSize().height * 0.15,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Zakhira_logo.png"))),
            ),
          ),
          Divider(
            color: bgcolor,
            thickness: 1.0,
          ),
          const MyOrdersInfo(),
          Divider(color: bgcolor, thickness: 8.0),

          // CustomListTile(
          //
          //     Text(
          //       "My Orders",
          //       style: TextStyle(fontWeight: FontWeight.w400),
          //     ),
          //     Icon(
          //       Icons.shopping_bag,
          //       color: orangeColor,
          //     ), () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => MyOrderScreen(),
          //       ));
          // }),
          CustomListTile(
              const Text(
                "My Favorites",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Icon(
                CupertinoIcons.heart_circle,
                color: Colors.black,
              ), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyFavoritesSCreen(),
                ));
          }),
          CustomListTile(
              const Text(
                "Following",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.star_border_outlined,
                color: Colors.black,
              ), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FollowingScreen(),
                ));
          }),

          CustomListTile(
              const Text(
                "Buyer Central",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.note_outlined,
                color: Colors.black,
              ), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BuyerCentral(),
                ));
          }),
          Divider(color: bgcolor, thickness: 8.0),
          CustomListTile(
              const Text(
                "Shipping Addresses",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.location_on_outlined,
                color: Colors.black,
              ), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddAddressScreen(),
                ));
          }),
          CustomListTile(
              const Text(
                "Manage Inventory",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.menu_book_outlined,
                color: Colors.black,
              ), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyCatalogScreen(),
                ));
          }),
          CustomListTile(
              const Text(
                "App feedback",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.feedback_outlined,
                color: Colors.black,
              ), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppFeedbackScreen(),
                ));
          }),
          CustomListTile(
              const Text(
                "Help Center",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.question_mark_outlined,
                color: Colors.black,
              ), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpCenterScreen(),
                ));
          }),
          CustomListTile(
              const Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.settings_outlined,
                color: Colors.black,
              ), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ));
          }),
        ],
      ),
    );
  }

  CustomListTile(Text text, Icon icon, onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: icon,
        title: text,
      ),
    );
  }
}
