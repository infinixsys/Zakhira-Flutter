import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/profile_list/help_center.dart';
import 'package:zakira/View/profile_list/myorder/myorderItems/all_view.dart';
import 'package:zakira/View/profile_list/myorder/myorderItems/closed_view.dart';
import 'package:zakira/View/profile_list/myorder/myorderItems/completed_view.dart';
import 'package:zakira/View/profile_list/myorder/myorderItems/processing_view.dart';
import 'package:zakira/View/profile_list/myorder/myorderItems/refund_view.dart';
import 'package:zakira/View/profile_list/myorder/myorderItems/review.dart';
import 'package:zakira/View/profile_list/myorder/myorderItems/shipped_view.dart';
import 'package:zakira/View/profile_list/myorder/myorderItems/to_be_confirmed.dart';
import 'package:zakira/View/profile_list/myorder/myorderItems/un_paid.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
 GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController ordersController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ordersController = TabController(length: 9, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ordersController.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Manage Orders", style: GoogleFonts.poppins()),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpCenterScreen(),
                    ));
              },
              icon: Icon(Icons.help_center_outlined)),
        ],
        bottom: TabBar(
          physics: ScrollPhysics(),
          isScrollable: true,
          unselectedLabelStyle: const TextStyle(fontSize: 14.0),
          labelStyle: const TextStyle(fontSize: 16.0),
          indicatorSize: TabBarIndicatorSize.label,
          controller: ordersController,
          tabs: const [
            Tab(
              text: "All(1)",
            ),
            Tab(
              text: "To be confirmed(0)",
            ),
            Tab(
              text: "UnPaid(1)",
            ),
            Tab(
              text: "Processing(0)",
            ),
            Tab(
              text: "Shipped(0)",
            ),
            Tab(
              text: "Refund(0)",
            ),
            Tab(
              text: "Completed(0)",
            ),
            Tab(
              text: "Closed(0)",
            ),
            Tab(
              text: "Review(1)",
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
      body: TabBarView(controller: ordersController, children:  [
        AllView(scaffoldkey: _scaffoldKey),
        ToBeConfirmed(),
        UnPaid(),
        ProcessingView(),
        ShippedView(),
        RefundView(),
        CompletedView(),
        ClosedView(),
        ReviewVeiw(),
      ]),
    );
  }
}
