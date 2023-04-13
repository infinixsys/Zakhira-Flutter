import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/Cart/cart_provider.dart';
import 'package:zakira/View/profile_list/help_center.dart';
import 'package:zakira/payment_screen/check_out_screen.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key, required this.productQuantity});

  String productQuantity;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final FlutterCart cart = FlutterCart();
  int moq = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpCenterScreen(),
                    ));
              },
              icon: const Icon(Icons.headset_mic_rounded)),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: cart.cartItem.isEmpty
                  ? Center(
                      child: Image.asset(
                        "assets/technology.png",
                        width: 180,
                        height: 180,
                      ),
                    )
                  : ListView.builder(
                      itemCount: cart.cartItem.length,
                      itemBuilder: (context, int index) {
                        final item = cart.cartItem[index];
                        int myQuantity = item.quantity;

                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ListTile(
                                    leading: Container(
                                      width:
                                          Utils().getScreenSize().width * 0.2,
                                      height:
                                          Utils().getScreenSize().height * 0.18,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border:
                                              Border.all(color: Colors.grey),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(item
                                                  .productDetails
                                                  .toString()))),
                                    ),
                                    title: Text(
                                      item.productName.toString(),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    width: Utils().getScreenSize().width * 0.94,
                                    height:
                                        Utils().getScreenSize().height * 0.12,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25.0, top: 10.0),
                                              child: Text(
                                                "White",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[700]),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, top: 10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                   Provider.of<CartProvider>(context, listen: false).removeFromCart(index);
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  size: 18.0,
                                                  weight: 2.0,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "₹${item.unitPrice.toString()}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "/${widget.productQuantity} Piece",
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: Utils()
                                                      .getScreenSize()
                                                      .width *
                                                  0.3,
                                              height: Utils()
                                                      .getScreenSize()
                                                      .height *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (myQuantity <= 5) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                                    backgroundColor:
                                                                        searchBarcolor,
                                                                    content:
                                                                        const Text(
                                                                      "You can't remove less than MOQ from cart",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )));
                                                      } else {
                                                        setState(() {
                                                          cart.decrementItemFromCart(
                                                              index);
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      width: Utils()
                                                              .getScreenSize()
                                                              .width *
                                                          0.08,
                                                      height: Utils()
                                                              .getScreenSize()
                                                              .height *
                                                          0.04,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 0.5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.remove,
                                                          size: 18,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Utils()
                                                            .getScreenSize()
                                                            .width *
                                                        0.12,
                                                    height: Utils()
                                                            .getScreenSize()
                                                            .height *
                                                        0.035,
                                                    child: Center(
                                                      child: Text(
                                                        myQuantity.toString(),
                                                        style: const TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        setState(() {
                                                          cart.incrementItemToCart(
                                                              index);
                                                        });
                                                      });
                                                    },
                                                    child: Container(
                                                      width: Utils()
                                                              .getScreenSize()
                                                              .width *
                                                          0.08,
                                                      height: Utils()
                                                              .getScreenSize()
                                                              .height *
                                                          0.04,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 0.5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          size: 18,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: bgcolor,
                              thickness: 2.0,
                            )
                          ],
                        );
                      },
                    )),
          Card(
            elevation: 2,
            child: Container(
              width: Utils().getScreenSize().width,
              height: Utils().getScreenSize().height * 0.10,
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                      "₹${cart.getTotalAmount()}",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                subtitle: const Text("Excluding shipping fee"),
                trailing: cart.cartItem.isNotEmpty?InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  CheckOutScreen(
                            productName: cart.cartItem[0].productName.toString(),
                            productImg: cart.cartItem[0].productDetails.toString(),
                            productMoq: cart.cartItem[0].quantity.toString(),
                            productPrice: cart.getTotalAmount().toString(),
                            productQty: cart.cartItem[0].itemCartIndex.toString(),
                            longDiscription: "",
                            productCategory: "",
                            productId: cart.cartItem[0].productId,
                            productStatus: "",
                            productType: "",
                            shortDiscription: "",
                            addressId: "6433b9a64d00c8bea2c15b53"

                          ),
                        ));
                  },
                  child: getCustomizedButton(
                      Utils().getScreenSize().width * 0.35,
                      Utils().getScreenSize().height * 0.06,
                      const Text(
                        "Check Out",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      orangeColor,
                      const Border()),
                ):SizedBox(height: 5.0,)
              ),
            ),
          )
        ],
      ),
    );
  }
}





// 