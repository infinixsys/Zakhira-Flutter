import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/sellerprofile/busonesstabbar/inquiries.dart';
import 'package:zakira/sellerprofile/busonesstabbar/orders.dart';
import 'package:zakira/sellerprofile/busonesstabbar/quotation.dart';

class BusinessHistory extends StatefulWidget {
  const BusinessHistory({super.key});

  @override
  State<BusinessHistory> createState() => _BusinessHistoryState();
}

class _BusinessHistoryState extends State<BusinessHistory>
    with SingleTickerProviderStateMixin {
  late TabController businesstabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    businesstabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    businesstabController.dispose();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Seller Name",style: GoogleFonts.poppins(),),
        centerTitle: true,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: businesstabController,
          tabs: [
            Tab(
              text: "Inquiries",
            ),
            Tab(
              text: "Quotation",
            ),
            Tab(
              text: "Orders",
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
          controller: businesstabController,
          children: [InquiriesPage(), QuotationPage(), OrdersPage()]),
    );
  }
}
