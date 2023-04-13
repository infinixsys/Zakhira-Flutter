import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Services/book_now_service.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/payment_screen/order_succes.dart';

class PaymentOption extends StatefulWidget {
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
  String addressId;
  PaymentOption(
      {super.key,
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
      required this.addressId});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  BookNowService bookNowService = BookNowService();
  int selectedOption = 0;
  bool isUpiSelected = false;
  bool isCreditCardSelected = false;
  bool isCodSelected = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bgcolor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: orangeColor),
        elevation: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Checkout", style: GoogleFonts.poppins()),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 15,
                  ),
                  child: Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: RadioListTile(
                      title: Row(
                        children: const [
                          Icon(Icons.credit_card),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Payment With Card'),
                        ],
                      ),
                      value: 0,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: RadioListTile(
                      title: Row(
                        children: const [
                          Icon(Icons.mobile_friendly_rounded),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Payment With Upi'),
                        ],
                      ),
                      value: 1,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: RadioListTile(
                      title: Row(
                        children: const [
                          Icon(Icons.currency_rupee),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Cash On Delivery'),
                        ],
                      ),
                      value: 2,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
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
              ],
            ),
          )),
          Column(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        int? quantity = int.tryParse(widget.productQty);
                        if (selectedOption == 0) {
                          bookNowService.bookOrder(widget.productId, quantity!,
                              "", widget.addressId, "Card", "ok", context);
                          setState(() {
                            isLoading = false;
                          });
                        } else if (selectedOption == 1) {
                          bookNowService.bookOrder(widget.productId, quantity!,
                              "", widget.addressId, "Upi", "ok", context);
                          setState(() {
                            isLoading = false;
                          });
                        } else if (selectedOption == 2) {
                          bookNowService.bookOrder(widget.productId, quantity!,
                              "", widget.addressId, "Cash", "ok", context);
                          setState(() {
                            isLoading = false;
                          });
                        } else {
                          print("Not Working");
                        }
                      } catch (e) {
                        print("EEE : $e");
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: getCustomizedButton(
                          Utils().getScreenSize().width,
                          Utils().getScreenSize().height * 0.065,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Place Order",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                            ],
                          ),
                          orangeColor,
                          const Border()),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
