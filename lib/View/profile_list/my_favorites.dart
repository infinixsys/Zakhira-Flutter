import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/profile_list/myfavorite/my_fvrt_bottomsheet.dart';

class MyFavoritesSCreen extends StatefulWidget {
  const MyFavoritesSCreen({super.key});

  @override
  State<MyFavoritesSCreen> createState() => _MyFavoritesSCreenState();
}

class _MyFavoritesSCreenState extends State<MyFavoritesSCreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgcolor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: orangeColor),
        elevation: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("My Favorites", style: GoogleFonts.poppins()),
      ),
      body: Column(
        children: [
          Card(
            elevation: 1,
            child: ListTile(
              title: InkWell(
                onTap: () {
                  _scaffoldKey
                  .currentState
                  ?.showBottomSheet(
                    elevation: 3,
                    
                    (context) => const MyFvrtBottomSheet());
                },
                child: Row(
                  children: [
                    Text("All"),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              trailing: TextButton(onPressed: () {}, child: Text("Edit")),
            ),
          )
        ],
      ),
    );
  }
}
