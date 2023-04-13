import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/Cart/variations.dart';
import 'package:zakira/View/chat%20screen/chat_screen_page.dart';
import 'package:zakira/View/homeScreen/product_Detail/variation.dart';
import 'package:zakira/payment_screen/check_out_screen.dart';
import 'package:zakira/store/store_view.dart';

class ButtonView extends StatefulWidget {
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
  ButtonView({
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
  State<ButtonView> createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 10,
        ),
        TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StoreView(),
                  ));
            },
            icon: Icon(Icons.store),
            label: Text("Store")),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreenPage(),
                ));
          },
          child: getCustomizedButton(
              Utils().getScreenSize().width * 0.3,
              Utils().getScreenSize().width * 0.1,
              Text(
                "Chat Now",
                style: TextStyle(color: orangeColor),
              ),
              Colors.white,
              Border.all(color: orangeColor)),
        ),
        InkWell(
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
          child: getCustomizedButton(
              Utils().getScreenSize().width * 0.3,
              Utils().getScreenSize().width * 0.1,
              const Text("Start Order", style: TextStyle(color: Colors.white)),
              orangeColor,
              const Border()),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
