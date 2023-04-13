import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zakira/Models/all_product.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/Cart/cart_provider.dart';
import 'package:zakira/View/Cart/cart_screen.dart';
import 'package:zakira/View/Cart/variationsoptions/options.dart';
import 'package:zakira/payment_screen/check_out_screen.dart';

class VariationsScreen extends StatefulWidget {
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
  VariationsScreen({
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
  State<VariationsScreen> createState() => _VariationsScreenState();
}

class _VariationsScreenState extends State<VariationsScreen> {
  FlutterCart cart = FlutterCart();

  void addToCartItem() {
    cart.addToCart(
        productId: widget.productId,
        productName: widget.productName,
        unitPrice: int.parse(widget.productPrice),
        quantity: int.parse(widget.productMoq),
        productDetailsObject: widget.productImg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          "Variations",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: Utils().getScreenSize().width * 0.25,
                      height: Utils().getScreenSize().height * 0.12,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.productImg))),
                    ),
                    Container(
                      width: Utils().getScreenSize().width * 0.5,
                      child: Text(
                        widget.productName,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, letterSpacing: 1),
                      ),
                    ),
                    Text(
                      "₹${widget.productPrice}",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: orangeColor),
                    ),
                  ],
                ),
                const Divider(thickness: 2.0),
                const SizedBox(
                  height: 8.0,
                ),
                VariationsOptions(
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
          )),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 2.0)]),
            child: Column(
              children: [
                ListTile(
                  title: const Text("Order"),
                  trailing: Text(
                    "₹${widget.productPrice}",
                    style: TextStyle(color: orangeColor),
                  ),
                ),
                ListTile(
                  title: const Text("Delivery"),
                  trailing: Text(
                    "₹0",
                    style: TextStyle(color: orangeColor),
                  ),
                ),
                ListTile(
                  title: const Text("Total"),
                  trailing: Text(
                    "₹${widget.productPrice}",
                    style: TextStyle(color: orangeColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        try {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(
                                  widget.productId,
                                  widget.productName,
                                  double.parse(widget.productPrice),
                                  int.parse(widget.productMoq),
                                  widget.productImg);

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Item Added")));
                          setState(() {});
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error.toString())));
                        }
                      },
                      child: getCustomizedButton(
                          Utils().getScreenSize().width * 0.45,
                          Utils().getScreenSize().height * 0.045,
                          Text(
                            "Add to cart",
                            style: TextStyle(
                                fontSize: 15,
                                color: orangeColor,
                                fontWeight: FontWeight.w500),
                          ),
                          Colors.deepOrangeAccent.withOpacity(0.3),
                          const Border()),
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
                                addressId: "6433b9a64d00c8bea2c15b53",
                              ),
                            ));
                      },
                      child: getCustomizedButton(
                          Utils().getScreenSize().width * 0.45,
                          Utils().getScreenSize().height * 0.045,
                          const Text(
                            "Start Order",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          orangeColor,
                          const Border()),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
