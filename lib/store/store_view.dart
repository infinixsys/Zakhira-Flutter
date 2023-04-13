import 'package:flutter/material.dart';

import 'package:zakira/View/homeScreen/SliverBarr/recommended.dart';
import 'package:zakira/View/homeScreen/SliverBarr/sliver_bar_view.dart';
import 'package:zakira/View/profile_list/add_address_screen.dart';
import 'package:zakira/View/profile_list/profile_screen.dart';
import 'package:zakira/View/startsellingonzakira/postproducts.dart';
import 'package:zakira/sellerprofile/sellerprofile.dart';
import 'package:zakira/store/home_store.dart';
import 'package:zakira/store/products_view.dart';
import 'package:zakira/store/profile_view.dart';

import '../View/homeScreen/SliverBarr/details_screen.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView>
    with SingleTickerProviderStateMixin {
  late TabController storeTabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    storeTabController.dispose();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              )),
          PopupMenuButton(
            icon: const Icon(Icons.add_box_outlined),
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  PostProductsScreen(),
                          ));
                    });
                  },
                  value: 0,
                  child: Text("Post")),
              PopupMenuItem(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddAddressScreen(),
                          ));
                    });
                  },
                  value: 1,
                  child: Text("Short")),
            ],
          ),
        ],
        title: TabBar(
          labelPadding: const EdgeInsets.only(right: 2),
          indicatorColor: Colors.black,
          indicatorWeight: 2.0,
          indicatorPadding: const EdgeInsets.only(right: 14.0),
          labelStyle:
              const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14.0,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          controller: storeTabController,
          tabs: const [
            Tab(
              text: "Home",
            ),
            Tab(
              text: "Products",
            ),
            Tab(
              text: "Profile",
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
      body: TabBarView(controller: storeTabController, children: const [
        HomeStore(),
        ProductsViewPage(),
        SelllerProfileScreen()
      ]),
    );
  }
}
