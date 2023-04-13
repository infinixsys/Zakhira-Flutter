import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:provider/provider.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/app_bar_button.dart';
import 'package:zakira/View/Cart/cart_screen.dart';
import 'package:zakira/View/ShortsScreen/shorts_screen.dart';
import 'package:zakira/View/chat%20screen/messanger_screen.dart';
import 'package:zakira/View/homeScreen/searchbar_field.dart';
import 'package:zakira/View/home_Screen.dart';
import 'package:zakira/productCategoryView/product_info.dart';

import '../View/Cart/cart_provider.dart';
import 'package:badges/badges.dart' as badges;

class ProductByCategoryScreen extends StatefulWidget {
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
  
  ProductByCategoryScreen({
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
  State<ProductByCategoryScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductByCategoryScreen> {
  FlutterCart cart = FlutterCart();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: getAppBarButton(const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          )),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchBarScreen(),
                  ));
            },
            child: getAppBarButton(const Icon(
              Icons.search,
              color: Colors.white,
            )),
          ),
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return badges.Badge(
                  position: BadgePosition.topEnd(top: 8, end: 3),
                  badgeAnimation: badges.BadgeAnimation.slide(),
                  badgeContent: Text(
                    '${cart.getCartItemCount()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: getAppBarButton(
                      Icon(Icons.shopping_cart_outlined, color: Colors.white)));
            },
            child: getAppBarButton(const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            )),
          ),
          getAppBarButton(
            PopupMenuButton(
              padding: EdgeInsets.only(bottom: 1.5),
              color: Colors.black45,
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
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
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: Utils().getScreenSize().height * 0.048),
        children: [
          ...List.generate(
            1,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 14, right: 14),
              child: Container(
                width: Utils().getScreenSize().width,
                height: Utils().getScreenSize().height * 0.72,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ProductInfoPage(
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
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, onTap) {
    return PopupMenuItem(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
