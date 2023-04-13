import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Utils/widgets.dart';
import 'package:zakira/View/chat%20screen/chat_screen_page.dart';

class Massengercreen extends StatefulWidget {
  const Massengercreen({super.key});

  @override
  State<Massengercreen> createState() => _MassengercreenState();
}

class _MassengercreenState extends State<Massengercreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 85,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: "Create group",
            onPressed: () {},
            icon: const Icon(Icons.group_add),
          )
        ],
        title: Container(
            width: Utils().getScreenSize().width * 0.80,
            height: Utils().getScreenSize().height * 0.06,
            child: SearchBarField(
                controller: _searchController,
                myhint: "Search Conversations",
                icon: Icon(Icons.search))),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
                5,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 18),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreenPage(),
                              ));
                        },
                        child: ListTile(
                          title: Text(
                            "PUMA",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            "ut ufbjg djeduydfey weydfywv hd gwfdw gfwf wftw2 wdfwt",
                            maxLines: 2,
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          ),
                          trailing: Text(
                            "yesterday",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: tabColor,
                            child: Text(
                              "SK",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            radius: 40,
                          ),
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
