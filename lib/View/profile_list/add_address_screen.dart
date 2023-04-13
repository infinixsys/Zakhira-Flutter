import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Models/all_address_model.dart';
import 'package:zakira/Services/address_service.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/profile_list/shipping_address.dart';
import 'package:zakira/View/profile_list/update_address.dart';
import 'package:http/http.dart' as http;

class AddAddressScreen extends StatefulWidget {
  AddAddressScreen({
    super.key,
  });

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  String firstName = "";
  List items = [];
  bool isLoading = false;

  AddressService addressService = AddressService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addressService.fetchAddressData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("Shipping Address", style: GoogleFonts.poppins()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShippingAddressPage(),
                      ));
                },
                child: const Text("Add"))
          ],
        ),
        body: isLoading
            ? const CircularProgressIndicator()
            : FutureBuilder(
                future: addressService.fetchAddressData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Visibility(
                      visible: snapshot.data!.results!.isNotEmpty,
                      replacement: const Center(
                        child: Text("No Products"),
                      ),
                      child: ListView.builder(
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
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
                                      setState(() {
                                        isLoading = true;
                                      });
                                      try {
                                        addressService
                                            .fetchSingleAddressData(
                                                snapshot.data!.results![index]
                                                    .addressId
                                                    .toString(),
                                                context,
                                                index)
                                            .then((value) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: const Text(
                                                    "Address Selected"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text("Ok"))
                                                ],
                                              );
                                            },
                                          );
                                        });
                                      } catch (error) {
                                        print("error: $error");
                                      }
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                    child: ListTile(
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
                                              "${snapshot.data!.results![index].firstName.toString()} ${snapshot.data!.results![index].lastName.toString()}",
                                              const Icon(Icons.account_circle,
                                                  color: Colors.black)),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          getAddressRow(
                                              "${snapshot.data!.results![index].phoneNumber.toString()}\n${snapshot.data!.results![index].alternateNumber.toString()} ",
                                              const Icon(Icons.call,
                                                  color: Colors.black)),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          getAddressRow(
                                              "${snapshot.data!.results![index].address.toString()} ${snapshot.data!.results![index].state.toString()} ${snapshot.data!.results![index].city.toString()} ${snapshot.data!.results![index].zipCode.toString()}",
                                              const Icon(Icons.home_work_sharp,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                      trailing: const Icon(
                                          Icons.arrow_forward_ios_rounded),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      "Delet Address"),
                                                  content: const Text(
                                                      "Are you really want delete this address."),
                                                  actions: [
                                                    TextButton(
                                                      child: const Text("No"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(); // dismiss the dialog
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: const Text("Yes"),
                                                      onPressed: () {
                                                        addressService
                                                            .deleteAddressById(
                                                                snapshot
                                                                    .data!
                                                                    .results![
                                                                        index]
                                                                    .addressId
                                                                    .toString())
                                                            .then((response) {
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.delete)),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateAddressScreen(
                                                    firstName: snapshot
                                                        .data!
                                                        .results![index]
                                                        .firstName
                                                        .toString(),
                                                    lastName: snapshot
                                                        .data!
                                                        .results![index]
                                                        .lastName
                                                        .toString(),
                                                    address: snapshot.data!
                                                        .results![index].address
                                                        .toString(),
                                                    alternatePhoneNumber:
                                                        snapshot
                                                            .data!
                                                            .results![index]
                                                            .alternateNumber
                                                            .toString(),
                                                    city: snapshot.data!
                                                        .results![index].city
                                                        .toString(),
                                                    phoneNumber: snapshot
                                                        .data!
                                                        .results![index]
                                                        .phoneNumber
                                                        .toString(),
                                                    state: snapshot.data!
                                                        .results![index].state
                                                        .toString(),
                                                    zipCode: snapshot.data!
                                                        .results![index].zipCode
                                                        .toString(),
                                                    addressId: snapshot
                                                        .data!
                                                        .results![index]
                                                        .addressId
                                                        .toString(),
                                                  ),
                                                ));
                                          },
                                          icon: const Icon(Icons.update)),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              "https://cdn.dribbble.com/users/1097272/screenshots/10725790/media/278de8c77f83f73a65ebd80f982b7f00.png?compress=1&resize=400x300"),
                          const Text(
                            "No Address Found",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    );
                  }
                },
              ));
  }

  // ---
  Widget getAddressRow(String title, Widget icon) {
    return ListTile(
      leading: icon,
      title: Text(title),
    );
  }
}

























//  Card(
//             elevation: 4,
//             child: Container(
//               width: Utils().getScreenSize().width,
//               height: Utils().getScreenSize().height * 0.08,
//               child: Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               ShippingAddressPage(address: address),
//                         ));
//                   },
//                   child: getCustomizedButton(
//                       Utils().getScreenSize().width * 0.85,
//                       Utils().getScreenSize().width * 0.12,
//                       Text("Add Address",
//                           style: TextStyle(color: Colors.white)),
//                       orangeColor,
//                       Border()),
//                 ),
//               ),
//             ),
//           )