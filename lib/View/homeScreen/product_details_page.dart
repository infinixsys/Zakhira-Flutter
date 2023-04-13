import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zakira/View/Cart/cart_provider.dart';
import 'package:zakira/View/Cart/cart_screen.dart';
import 'package:zakira/View/ShortsScreen/shorts_screen.dart';
import 'package:zakira/View/chat%20screen/messanger_screen.dart';
import 'package:zakira/View/homeScreen/SliverBarr/details_screen.dart';
import 'package:zakira/View/homeScreen/SliverBarr/recommended.dart';
import 'package:zakira/View/homeScreen/SliverBarr/sliver_bar_view.dart';
import 'package:zakira/View/home_Screen.dart';
import 'package:badges/badges.dart' as badges;

class ProductDetailsScreen extends StatefulWidget {
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
  ProductDetailsScreen({
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
  State<ProductDetailsScreen> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController sliverTabBarController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliverTabBarController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sliverTabBarController.dispose();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Marketplace",
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 25,
              )),
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeAnimation: badges.BadgeAnimation.slide(),
                badgeContent: Text(
                  '${cartProvider.itemCount.toString()}',
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CartScreen(productQuantity: ""),
                          ));
                    },
                    icon: Icon(Icons.shopping_cart_outlined)),
              );
            },
          ),
          PopupMenuButton(
            padding: EdgeInsets.only(bottom: 1.5),
            itemBuilder: (context) => [
              _buildPopupMenuItem("Home", () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                });
              }),
              _buildPopupMenuItem("Messanger", () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Massengercreen(),
                      ));
                });
              }),
              _buildPopupMenuItem("Cart", () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CartScreen(productQuantity: widget.productQty),
                      ));
                });
              }),
              _buildPopupMenuItem("Shorts", () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShortsScreen(),
                      ));
                });
              }),
            ],
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25,
          ),
        ),
        bottom: TabBar(
          labelPadding: EdgeInsets.only(right: 15),
          indicatorColor: Colors.black,
          indicatorWeight: 2.0,
          indicatorPadding: EdgeInsets.only(right: 14.0),
          labelStyle: TextStyle(fontSize: 14.0),
          indicatorSize: TabBarIndicatorSize.label,
          controller: sliverTabBarController,
          tabs: [
            Tab(
              text: "Overview",
            ),
            Tab(
              text: "Details",
            ),
            Tab(
              text: "Recommended",
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
      body: TabBarView(controller: sliverTabBarController, children: [
        SliverbarView(
          productName: widget.productName,
          longDiscription: widget.longDiscription,
          productCategory: widget.productId,
          productImg: widget.productImg,
          productId: widget.productId,
          productMoq: widget.productMoq,
          productPrice: widget.productPrice,
          productQty: widget.productQty,
          productStatus: widget.productStatus,
          productType: widget.productType,
          shortDiscription: widget.shortDiscription,
        ),
        DetailsScreen(
          productName: widget.productName,
          longDiscription: widget.longDiscription,
          productCategory: widget.productId,
          productImg: widget.productImg,
          productId: widget.productId,
          productMoq: widget.productMoq,
          productPrice: widget.productPrice,
          productQty: widget.productQty,
          productStatus: widget.productStatus,
          productType: widget.productType,
          shortDiscription: widget.shortDiscription,
        ),
        RecomendedScreen()
      ]),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, onTap) {
    return PopupMenuItem(
      onTap: onTap,
      child: Text(title),
    );
  }
}
