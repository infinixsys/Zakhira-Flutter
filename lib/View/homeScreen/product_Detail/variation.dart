import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/Cart/variations.dart';

class VariationScreen extends StatefulWidget {
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
  VariationScreen({
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
  State<VariationScreen> createState() => _VariationScreenState();
}

class _VariationScreenState extends State<VariationScreen> {
  int selectedVariation = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VariationsScreen(
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
            ));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Variations",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Select From",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: orangeColor,
                          fontSize: 12),
                    ),
                    TextSpan(
                      text: "  Color:1,",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 12),
                    ),
                  ])),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ...List.generate(1, (index) => variationImages(index))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  variationImages(int index) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      height: Utils().getScreenSize().height * 0.06,
      width: Utils().getScreenSize().width * 0.12,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(widget.productImg)),
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
