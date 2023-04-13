import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/chat%20screen/chat_screen_page.dart';
import 'package:zakira/View/homeScreen/product_details_page.dart';
import 'package:zakira/payment_screen/check_out_screen.dart';

class ProductInfoPage extends StatefulWidget {
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
  ProductInfoPage({
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
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  int selectedImage = 0;

  void saveProductDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("ProductName", widget.productName);
    prefs.setString("moq", widget.productMoq);
    prefs.setString("produtcId", widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return widget.productName.isNotEmpty ||
            widget.productImg.isNotEmpty ||
            widget.productQty.isNotEmpty ||
            widget.productMoq.isNotEmpty
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Utils().getScreenSize().width,
                  height: Utils().getScreenSize().height * 0.38,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.productImg))),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ...List.generate(
                        1,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: smallImages(index),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    widget.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 10),
                  child: Text(
                    "₹${widget.productPrice}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 10),
                  child: Text(
                    "Min.order: ${widget.productMoq} Pieces",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: const TextSpan(children: [
                        TextSpan(
                          text: "2 yrs.",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        TextSpan(
                          text: "IND.",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        TextSpan(
                          text:
                              "Nokia Electronics Pvt,Ltd.Karakaari 1100XX, India",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ])),
                ),
                SizedBox(
                  height: Utils().getScreenSize().height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatScreenPage(),
                            ));
                      },
                      child: getCustomizedButton(
                          Utils().getScreenSize().width * 0.42,
                          Utils().getScreenSize().width * 0.08,
                          const Text("Chat Now",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          Colors.white,
                          Border.all(color: Colors.black)),
                    ),
                    InkWell(
                      onTap: () async {
                        saveProductDetails();

                        await Navigator.push(
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
                                  addressId: "6433b9a64d00c8bea2c15b53"),
                            ));
                      },
                      child: getCustomizedButton(
                          Utils().getScreenSize().width * 0.42,
                          Utils().getScreenSize().width * 0.08,
                          const Text("Start Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          orangeColor,
                          const Border()),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
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
        margin: const EdgeInsets.only(left: 5),
        height: Utils().getScreenSize().height * 0.065,
        width: Utils().getScreenSize().width * 0.130,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(widget.productImg)),
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
                color:
                    selectedImage == index ? Colors.black : Colors.transparent,
                width: 2)),
      ),
    );
  }
}
