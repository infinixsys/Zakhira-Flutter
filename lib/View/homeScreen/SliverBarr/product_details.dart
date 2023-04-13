import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/homeScreen/SliverBarr/product_title_info.dart';
import 'package:zakira/View/homeScreen/product_Detail/listtile_screen.dart';

import 'package:zakira/View/homeScreen/product_Detail/reviews.dart';
import 'package:zakira/View/homeScreen/product_Detail/store_visit.dart';
import 'package:zakira/View/homeScreen/product_Detail/variation.dart';

class ProductDetailsView extends StatefulWidget {
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
  ProductDetailsView({
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
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ProductTitleInfo(
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
          const Divider(),
          VariationScreen(
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
          const Divider(),
          const ListTileScreen(),
          const Divider(),
          const ReviewsScreen(),
          const Divider(),
          const StoreVisit(),
          SizedBox(
            height: Utils().getScreenSize().height * 0.2,
          )
        ],
      ),
    );
  }
}
