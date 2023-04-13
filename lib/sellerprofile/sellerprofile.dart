// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:zakira/Utils/Utils.dart';
// import 'package:zakira/Utils/colors.dart';
// import 'package:zakira/View/profile_list/profile_screen.dart';
// import 'package:zakira/sellerprofile/businesshistory.dart';
// import 'package:zakira/sellerprofile/profile.dart';

// class SellerProfileScreen extends StatefulWidget {
//   const SellerProfileScreen({super.key});

//   @override
//   State<SellerProfileScreen> createState() => _SellerProfileScreenState();
// }

// class _SellerProfileScreenState extends State<SellerProfileScreen> with SingleTickerProviderStateMixin {

//    late TabController profiletabController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     profiletabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//    profiletabController.dispose();
//   }

//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: AppBar(
//           iconTheme: IconThemeData(color: orangeColor),
//           elevation: 3,
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           title: Text("Business Card", style: GoogleFonts.poppins()),

//           bottom:TabBar(
//             indicatorSize: TabBarIndicatorSize.label,
//             controller: profiletabController,
//             tabs: [
//                 Tab(
//                   text: "Profile",
//                 ),
//                 Tab(
//                   text: "History",
//                 ),
//             ],
//             onTap: (int index) {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//             },
//                  ),
//         ),
//          body:  TabBarView(controller: profiletabController, children: [
//                                       SellerProfileScreen(),
//                                       BusinessHistory(),
//                                      ]),
//     );
//   }
// }