import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/ShortsScreen/profilebottomsheetitems/profile_items.dart';
import 'package:zakira/View/profile_info/profile_header_widget.dart';
import 'package:zakira/View/profile_info/tabview/seller_products.dart';
import 'package:zakira/View/profile_info/tabview/shorts_view.dart';
import 'package:zakira/store/profile_view.dart';

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({super.key});

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:Utils().getScreenSize().width,
      height:Utils().getScreenSize().height*0.7,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black,blurRadius: 2.0 )
        ]
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Profile"),
          backgroundColor: Colors.white,
        ),
        body:  DefaultTabController(

        length: 2,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                
                delegate: SliverChildListDelegate(
                  [
                    const ProfleItems(),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[500],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: const [
                    Tab(
                     child: Text("Shorts"),
                    ),
                     Tab(
                      child:Text("About") ,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    
                    ShortsViewScrenn(),
                    SelllerProfileScreen()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
