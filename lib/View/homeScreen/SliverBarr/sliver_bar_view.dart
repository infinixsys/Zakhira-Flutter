import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/homeScreen/SliverBarr/product_details.dart';
import 'package:zakira/View/homeScreen/SliverBarr/sliverbar_items.dart';
import 'package:zakira/View/homeScreen/product_Detail/button.dart';

class SliverbarView extends StatefulWidget {
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
  SliverbarView({
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
  State<SliverbarView> createState() => _SliverbarViewState();
}

class _SliverbarViewState extends State<SliverbarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: true,
            expandedHeight: Utils().getScreenSize().height * 0.56,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: SliverBarItems(
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
                )),
          ),
          SliverFillRemaining(
              child: Column(
            children: [
              Expanded(
                  child: ProductDetailsView(
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
              )),
              SizedBox(
                height: 15,
              ),
              ButtonView(
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
              SizedBox(
                height: 10,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
