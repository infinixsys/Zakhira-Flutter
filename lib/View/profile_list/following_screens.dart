import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/profile_list/followingscreens/post.dart';
import 'package:zakira/View/profile_list/followingscreens/products.dart';
import 'package:zakira/View/profile_list/followingscreens/suppliers.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        iconTheme: IconThemeData(color: orangeColor),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("My favorites", style: GoogleFonts.poppins()),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: tabController,
          tabs: [
            Tab(
              text: "Products(0)",
            ),
            Tab(
              text: "Suppliers(0)",
            ),
            Tab(
              text: "Post()",
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
        controller: tabController,
        children: [
          ProductsScreen(),
          SuppliersScreen(),
          PostScreen()
      ]),
    );
  }
}