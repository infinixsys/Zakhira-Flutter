import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/chat%20screen/chat_screen_page.dart';
import 'package:zakira/addtogroup/price_edit_screen.dart';
import 'package:zakira/payment_screen/check_out_screen.dart';

class ProductFullImage extends StatefulWidget {
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
   ProductFullImage({super.key,
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
  State<ProductFullImage> createState() => _ProductFullImageState();
}

class _ProductFullImageState extends State<ProductFullImage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: Utils().getScreenSize().width * 0.08,
                height: Utils().getScreenSize().height * 0.04,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Icon(Icons.close),
                ),
              ),
            ),
            SizedBox(
              height: Utils().getScreenSize().height * 0.02,
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0, right: 8.0),
              height: Utils().getScreenSize().height * 0.55,
              width: Utils().getScreenSize().width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          widget.productImg))),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(1, (index) => smallImages(index))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Utils().getScreenSize().height * 0.10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreenPage(),
                          ));
                    },
                    child: getCustomizedButton(
                        Utils().getScreenSize().width * 0.26,
                        Utils().getScreenSize().height * 0.05,
                        Text(
                          "Chat Now",
                          style: TextStyle(
                              color: orangeColor, fontWeight: FontWeight.w600),
                        ),
                        Colors.white,
                        Border.all(color: orangeColor)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOutScreen(
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
                      addressId: "",
                            ),
                          ));
                    },
                    child: getCustomizedButton(
                        Utils().getScreenSize().width * 0.26,
                        Utils().getScreenSize().height * 0.05,
                        const Text(
                          "Order Now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        orangeColor,
                        Border.all(color: orangeColor)),
                  ),
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState?.showBottomSheet(
                          elevation: 3,
                          (context) => const PriceEditingScreen());
                    },
                    child: getCustomizedButton(
                        Utils().getScreenSize().width * 0.26,
                        Utils().getScreenSize().height * 0.05,
                        const Text("Add To Group",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        orangeColor,
                        Border.all(color: orangeColor)),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
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
        height: Utils().getScreenSize().height * 0.07,
        width: Utils().getScreenSize().width * 0.14,
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
