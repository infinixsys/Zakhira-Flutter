import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';

class VariationsOptions extends StatefulWidget {
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
  VariationsOptions({
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
  State<VariationsOptions> createState() => _VariationsOptionsState();
}

class _VariationsOptionsState extends State<VariationsOptions> {
  FlutterCart cart = FlutterCart();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            1,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    leading: Container(
                      width: Utils().getScreenSize().width * 0.15,
                      height: Utils().getScreenSize().height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.productImg))),
                    ),
                    title: Text(widget.productName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(widget.shortDiscription),
                        ),
                  ),
                ))
      ],
    );
  }
}
