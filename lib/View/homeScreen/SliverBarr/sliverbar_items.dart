import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/homeScreen/product_full_image.dart';

class SliverBarItems extends StatefulWidget {
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
   SliverBarItems({super.key,
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
  State<SliverBarItems> createState() => _SliverBarItemsState();
}

class _SliverBarItemsState extends State<SliverBarItems> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => ProductFullImage(
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
            ),));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: Utils().getScreenSize().height * 0.45,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        widget.productImg))),
          ),
        ),
        SizedBox(height: Utils().getScreenSize().height*0.007,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [...List.generate(1, (index) => smallImages(index))],
          ),
        )
      ],
    );
  }

  InkWell smallImages(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        height: selectedImage == index
            ? Utils().getScreenSize().height * 0.09
            : Utils().getScreenSize().height * 0.08,
        width: selectedImage == index
            ? Utils().getScreenSize().height * 0.09
            : Utils().getScreenSize().width * 0.16,
        decoration: BoxDecoration(
            image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                   widget.productImg)),
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color:
                    selectedImage == index ? Colors.black : Colors.transparent,
                width: 2)),
      ),
    );
  }
}
