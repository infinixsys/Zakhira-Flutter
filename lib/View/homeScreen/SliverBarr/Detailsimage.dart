import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:zakira/Utils/Utils.dart';

class DetailsImage extends StatefulWidget {
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
   DetailsImage({super.key,
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
  State<DetailsImage> createState() => _DetailsImageState();
}

class _DetailsImageState extends State<DetailsImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Utils().getScreenSize().width,
          height: Utils().getScreenSize().height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    widget.productImg ))),
        ),
        Divider(),
       
      ],
    );
  }
}
