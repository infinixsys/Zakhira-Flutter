import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/homeScreen/SliverBarr/Detailsimage.dart';

class DetailsScreen extends StatefulWidget {
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
  DetailsScreen({
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
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("Details"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.longDiscription+widget.shortDiscription,
                  textScaleFactor: 1.2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              Divider(),
              DetailsImage(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
