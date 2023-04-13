import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';

import 'package:zakira/View/profile_list/add_address_screen.dart';
import 'package:zakira/payment_screen/payment_option.dart';

class CheckOutScreen extends StatefulWidget {
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
  CheckOutScreen(
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
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int selectedOption = 0;

  String firstName = "";
  String lastName = "";
  String state = "";
  String city = "";
  String address = "";
  int zipCode = 0;
  String phoneNumber = "";
  String alternateNumber = "";
  String addressId = "";
  bool isHomeSelected = false;
  bool isStoreSelected = false;
  bool isWorkSelected = false;
  Future<void> getDataFromSharedPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      firstName = pref.getString('firstName') ?? '';
      lastName = pref.getString('lastName') ?? '';
      state = pref.getString('state') ?? '';
      city = pref.getString('city') ?? '';
      address = pref.getString('address') ?? '';
      zipCode = pref.getInt("zipCode") ?? 0;
      phoneNumber = pref.getString('phoneNumber') ?? '';
      alternateNumber = pref.getString('alternateNumber') ?? '';
      addressId = pref.getString('addressId') ?? '';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text("Place Order", style: GoogleFonts.poppins()),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddAddressScreen(),
                                    ));
                              },
                              child: address == ""
                                  ? const SizedBox(
                                      height: 2.0,
                                    )
                                  : ListTile(
                                      title: const Text(
                                        "Ship to",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          getAddressRow(
                                              "${firstName} ${lastName}",
                                              const Icon(Icons.account_circle,
                                                  color: Colors.black)),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          getAddressRow(
                                              "${phoneNumber}\n${alternateNumber}",
                                              const Icon(Icons.call,
                                                  color: Colors.black)),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          getAddressRow(
                                              "${address} ${city} ${state} ${zipCode.toString()}",
                                              const Icon(Icons.account_circle,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                      trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded),
                                    ),
                            ),
                            const Divider(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddAddressScreen(),
                                    ));
                              },
                              child: const ListTile(
                                title: Text("Add Shipping Address"),
                                trailing: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: Container(
                        width: Utils().getScreenSize().width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                "Product Details",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                "Sold by: Nokia Electronics from unique trading Pvt Ltd.",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                            ListTile(
                              leading: Card(
                                child: Container(
                                  width: Utils().getScreenSize().width * 0.15,
                                  height: Utils().getScreenSize().height * 0.1,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              NetworkImage(widget.productImg))),
                                ),
                              ),
                              title: Text(
                                widget.productName,
                                maxLines: 2,
                              ),
                              subtitle:
                                  Text("Min order: ${widget.productMoq} Piece"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 15,
                              ),
                              child: Text(
                                "Shipping Method",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: RadioListTile(
                                  title: Row(
                                    children: const [
                                      Icon(Icons.home),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('Home'),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: RadioListTile(
                                  title: Row(
                                    children: const [
                                      Icon(Icons.store),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('Store'),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: RadioListTile(
                                  title: Row(
                                    children: const [
                                      Icon(Icons.home_work),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('Office'),
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
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Colors.black54, blurRadius: 2.0)
              ]),
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
                    subtitle: const Text("Including Tax"),
                    trailing: Column(
                      children: [
                        Text(
                          "₹${widget.productPrice}",
                          style: TextStyle(color: orangeColor),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (address == "") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: searchBarcolor,
                                content: const Text(
                                  "Please Add Address",
                                  style: TextStyle(color: Colors.black),
                                )));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentOption(
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
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: getCustomizedButton(
                              Utils().getScreenSize().width,
                              Utils().getScreenSize().height * 0.065,
                              const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
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
            ),
          ],
        ));
  }

  Widget getAddressRow(String title, Widget icon) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
