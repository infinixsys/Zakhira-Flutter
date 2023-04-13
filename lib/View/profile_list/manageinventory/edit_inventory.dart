import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Services/delet_product_service.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/homeScreen/home.dart';
import 'package:zakira/View/home_Screen.dart';
import 'package:zakira/View/profile_info/profile_header_widget.dart';
import 'package:zakira/View/profile_list/manage_inventory.dart';
import 'package:zakira/View/profile_list/manageinventory/catelogues.dart';
import 'package:zakira/View/profile_list/manageinventory/inventory.dart';
import 'package:zakira/View/profile_list/manageinventory/inventory_product_info.dart';
import 'package:zakira/View/profile_list/manageinventory/pricing.dart';

import '../../profile_info/tabview/shorts_view.dart';

class EditInventory extends StatefulWidget {
  String productName;
  String productStatus;
  String productQty;
  String productPrice;
  String productMoq;
  String productCategory;
  String productType;
  String productImg;
  String productId;
  String shortDiscription;
  String longDiscription;
  EditInventory({
    super.key,
    required this.productName,
    required this.productStatus,
    required this.productQty,
    required this.productPrice,
    required this.productMoq,
    required this.productCategory,
    required this.productType,
    required this.productImg,
    required this.productId,
    required this.shortDiscription,
    required this.longDiscription,
  });

  @override
  State<EditInventory> createState() => _EditInventoryState();
}

class _EditInventoryState extends State<EditInventory> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Manage Inventory", style: GoogleFonts.poppins()),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Delet Product"),
                      content: Text("Are you really want delet this product."),
                      actions: [
                        TextButton(
                          child: Text("No"),
                          onPressed: () {
                            Navigator.of(context).pop(); // dismiss the dialog
                          },
                        ),
                        TextButton(
                          child: Text("Yes"),
                          onPressed: () {
                            DeletProduct()
                                .deleteProductById(widget.productId)
                                .then((response) async {
                              await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                  (route) => false);
                            });
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: orangeColor,
              )),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    InventoryProductInfo(
                      productName: widget.productName,
                      productStatus: widget.productStatus,
                      productCategory: widget.productCategory,
                      productMoq: widget.productMoq,
                      productPrice: widget.productPrice,
                      productQty: widget.productQty,
                      productType: widget.productType,
                      productImg: widget.productImg,
                    ),
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
                  labelColor: orangeColor,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: orangeColor,
                  tabs: const [
                    Tab(
                      child: Text("Pricing"),
                    ),
                    Tab(
                      child: Text("Inventory"),
                    ),
                    Tab(
                      child: Text("Catalogue"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PricingUpadte(
                      productName: widget.productName,
                      productStatus: widget.productStatus,
                      productCategory: widget.productCategory,
                      productMoq: widget.productMoq,
                      productPrice: widget.productPrice,
                      productQty: widget.productQty,
                      productType: widget.productType,
                      productImg: widget.productImg,
                      productId: widget.productId,
                      shortDiscription: widget.shortDiscription,
                      longDiscription: widget.longDiscription,
                    ),
                    InventoryUpdate(),
                    CatelougeScreen(
                      productName: widget.productName,
                      productStatus: widget.productStatus,
                      productCategory: widget.productCategory,
                      productMoq: widget.productMoq,
                      productPrice: widget.productPrice,
                      productQty: widget.productQty,
                      productType: widget.productType,
                      productImg: widget.productImg,
                      productId: widget.productId,
                      shortDiscription: widget.shortDiscription,
                      longDiscription: widget.longDiscription,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
