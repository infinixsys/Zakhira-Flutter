import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTitleInfo extends StatefulWidget {
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
   ProductTitleInfo({super.key,
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
  State<ProductTitleInfo> createState() => _ProductTitleInfoState();
}

class _ProductTitleInfoState extends State<ProductTitleInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text("₹${widget.productPrice}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)),
        ),
         Padding(
            padding: EdgeInsets.only(left: 18.0, top: 4.0),
            child: Text(
              "Min.order: ${widget.productMoq} piece",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ListTile(
          title: Text(
            widget.productName,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1),
          ),
          trailing: Icon(
            CupertinoIcons.heart,
          ),
        ),
      ],
    );
  }
}
