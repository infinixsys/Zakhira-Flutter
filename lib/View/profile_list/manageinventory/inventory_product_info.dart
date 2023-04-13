import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';

class InventoryProductInfo extends StatefulWidget {
  String productName;
  String productStatus;
  String productQty;
  String productPrice;
  String productMoq;
  String productCategory;
  String productType;
  String productImg;
  InventoryProductInfo(
      {super.key,
      required this.productName,
      required this.productStatus,
      required this.productQty,
      required this.productPrice,
      required this.productMoq,
      required this.productCategory,
      required this.productType,
      required this.productImg
      });

  @override
  State<InventoryProductInfo> createState() => _InventoryProductInfoState();
}

class _InventoryProductInfoState extends State<InventoryProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Utils().getScreenSize().height * 0.3,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
             widget.productName,
             maxLines: 2,
             overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5),
            ),
          ),
          ListTile(
            leading: Container(
              height: Utils().getScreenSize().height * 0.1,
              width: Utils().getScreenSize().width * 0.18,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          widget.productImg))),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                SizedBox(
                  height: 10.0,
                ),
                Text("Name: ${widget.productName}"),
                SizedBox(
                  height: 5.0,
                ),
                Text("Availble: ${widget.productQty}"),
                SizedBox(
                  height: 5.0,
                ),
                Text("Price: ${widget.productPrice}"),
                SizedBox(
                  height: 5.0,
                ),
                Text("MOQ: ${widget.productMoq}"),
                SizedBox(
                  height: 5.0,
                ),
                Text("Category: ${widget.productCategory}"),
                SizedBox(
                  height: 5.0,
                ),
                Text("Product type: ${widget.productType}"),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }
}
