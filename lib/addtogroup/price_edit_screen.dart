import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/homeScreen/product_details_page.dart';

class PriceEditingScreen extends StatefulWidget {
  const PriceEditingScreen({super.key});

  @override
  State<PriceEditingScreen> createState() => _PriceEditingScreenState();
}

class _PriceEditingScreenState extends State<PriceEditingScreen> {
  String price = "4,760.12";
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: Utils().getScreenSize().width,
        height: Utils().getScreenSize().height * 0.85,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => ProductDetailsScreen(
                            //         longDiscription: "",
                            //         productCategory: "",
                            //         productId: "",
                            //         productImg: "",
                            //         productMoq: "",
                            //         productName: "",
                            //         productPrice: "",
                            //         productQty: "",
                            //         productStatus: "",
                            //         productType: "",
                            //         shortDiscription: "",
                            //       ),
                            //     )),
                            child: Container(
                              width: Utils().getScreenSize().width * 0.4,
                              height: Utils().getScreenSize().width * 0.4,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://static.zara.net/photos///2022/I/0/2/p/3918/250/610/2/w/438/3918250610_2_1_1.jpg?ts=1661873101679"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Ny Original Jacket",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "My Fashions",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Size: M",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            "Seller Name",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        getCustomContainer("My Fashions"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            "Price",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        getCustomContainer("₹$price"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            "Edit Price",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Utils().getScreenSize().width * 0.9,
                          height: Utils().getScreenSize().height * 0.08,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: price,
                                prefixIcon: const Icon(Icons.currency_rupee)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )),
              getCustomizedButton(
                  Utils().getScreenSize().width * 0.8,
                  -Utils().getScreenSize().height * 0.06,
                  Text(
                    "Add Now",
                    style: TextStyle(color: Colors.white),
                  ),
                  orangeColor,
                  Border()),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  getCustomContainer(String title) {
    return Container(
        width: Utils().getScreenSize().width * 0.9,
        height: Utils().getScreenSize().height * 0.08,
        decoration: BoxDecoration(
            color: Colors.white30,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
            )
          ],
        ));
  }
}
