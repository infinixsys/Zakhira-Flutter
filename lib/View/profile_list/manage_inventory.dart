import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Models/all_product.dart';
import 'package:zakira/Services/all_product_api.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Utils/widgets.dart';
import 'package:zakira/View/Cart/cart_screen.dart';
import 'package:zakira/View/profile_list/followingscreens/post.dart';
import 'package:zakira/View/profile_list/manageinventory/edit_inventory.dart';
import 'package:http/http.dart' as http;
import 'package:zakira/View/startsellingonzakira/postproducts.dart';

import '../chat screen/messanger_screen.dart';

class MyCatalogScreen extends StatefulWidget {
  const MyCatalogScreen({super.key});

  @override
  State<MyCatalogScreen> createState() => _MyCatalogScreenState();
}

class _MyCatalogScreenState extends State<MyCatalogScreen> {
  late Future<List<AllProduct>> futureProducts;
  TextEditingController searchController = TextEditingController();
  ProductService productService = ProductService();
  List<Results> productList = [];
  List<Results> originalproductList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productService.fetchAllProductData().then((product) {
      setState(() {
        originalproductList = product!.results!;
        productList = originalproductList;
      });
    });
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        productList = originalproductList;
      });
    } else {
      List<Results> fillterList = productList.where((product) {
        return product.productName!.toLowerCase().contains(query.toLowerCase());
      }).toList();
      setState(() {
        productList = fillterList;
      });
    }
  }

  void _sortProductsByNewest() {
    setState(() {
      productList.sort((a, b) => b.createdDate!.compareTo(a.createdDate!));
    });
  }

  void _sortProductsByOldest() {
    setState(() {
      productList.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Manage Inventory", style: GoogleFonts.poppins()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostProductsScreen(),
                    ));
              },
              icon: Icon(
                Icons.add_box_outlined,
                color: orangeColor,
              )),
          PopupMenuButton(
            icon: Icon(
              Icons.filter_alt,
              color: orangeColor,
            ),
            itemBuilder: (context) => [
              _buildPopupMenuItem("Newest", () {
                _sortProductsByNewest();
              }),
              _buildPopupMenuItem(
                "Oldest",
                () {
                  _sortProductsByOldest();
                },
              )
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  filled: true,
                  fillColor: searchBarcolor,
                  hintText: "Search Product",
                  prefixIcon: const Icon(Icons.search)),
              onChanged: (value) {
                searchProducts(value);
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: productService.fetchAllProductData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return productList.isEmpty
                      ? const Center(
                          child: Text(
                            "No Products",
                            style: TextStyle(),
                          ),
                        )
                      : ListView.builder(
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditInventory(
                                              productName: productList[index]
                                                  .productName
                                                  .toString(),
                                              productCategory: "",
                                              productImg: productList[index]
                                                  .image
                                                  .toString(),
                                              productMoq: productList[index]
                                                  .moq
                                                  .toString(),
                                              productPrice: productList[index]
                                                  .price
                                                  .toString(),
                                              productQty: productList[index]
                                                  .stockQuantity
                                                  .toString(),
                                              productStatus: "",
                                              productType: productList[index]
                                                  .productType
                                                  .toString(),
                                              productId: productList[index]
                                                  .productId
                                                  .toString(),
                                              shortDiscription: "",
                                              longDiscription: ""),
                                        ));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Utils().getScreenSize().height *
                                            0.01,
                                      ),
                                      const Divider(),
                                      SizedBox(
                                        height: Utils().getScreenSize().height *
                                            0.01,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Text(
                                          productList[index]
                                              .productName
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils().getScreenSize().height *
                                            0.001,
                                      ),
                                      ListTile(
                                        leading: Container(
                                          height:
                                              Utils().getScreenSize().height *
                                                  0.1,
                                          width: Utils().getScreenSize().width *
                                              0.18,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      productList[index]
                                                          .image
                                                          .toString()))),
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                                "Availble: ${productList[index].stockCount.toString()}"),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                                "Price: ${productList[index].price.toString()}"),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                                "MOQ: ${productList[index].moq.toString()}"),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                                "Date: ${productList[index].createdDate.toString()}"),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                                "Product type: ${productList[index].productType.toString()}"),
                                          ],
                                        ),
                                        trailing: const Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      )),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, onTap) {
    return PopupMenuItem(
      onTap: onTap,
      child: Text(title),
    );
  }
}
