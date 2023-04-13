// import 'package:flutter/material.dart';
// import 'package:zakira/View/profile_info/profile_header_widget.dart';
// import 'package:zakira/View/profile_info/profile_info.dart';

// class ProfileSliverBar extends StatefulWidget {
//   const ProfileSliverBar({super.key});

//   @override
//   State<ProfileSliverBar> createState() => _ProfileSliverBarState();
// }

// class _ProfileSliverBarState extends State<ProfileSliverBar> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(length: 2, 
    
//     child:NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) => [const ProfileBaseScreen(),
//     SliverToBoxAdapter(
//       child: ProfileHeaderWidget(),
//     )
//     ], body: Text("data")) );
//   }
// }