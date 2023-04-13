import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Utils/widgets.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
            width: Utils().getScreenSize().width * 0.88,
            height: Utils().getScreenSize().height * 0.065,
            child: SearchBarField(
                controller: searchController,
                myhint: "Search",
                icon: Icon(
                  Icons.search,
                  color: orangeColor,
                ))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.mic,
                  size: 25,
                )),
          )
        ],
      ),
    );
  }
}
