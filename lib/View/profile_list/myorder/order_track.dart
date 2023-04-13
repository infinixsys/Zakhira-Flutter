import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/homeScreen/product_details_page.dart';

class OrderTrackScreen extends StatefulWidget {
  const OrderTrackScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderTrackScreen> {
  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.",
        "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: orangeColor),
        elevation: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("My Orders", style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ProductDetailsScreen(
                //            longDiscription: "",
                //                     productCategory: "",
                //                     productId: "",
                //                     productImg: "",
                //                     productMoq: "",
                //                     productName: "",
                //                     productPrice: "",
                //                     productQty: "",
                //                     productStatus: "",
                //                     productType: "",
                //                     shortDiscription: "",
                //       ),
                //     ));
              },
              child: Card(
                color: bgcolor,
                child: ListTile(
                  leading: Image.network(
                    "https://static.zara.net/photos///2022/I/0/2/p/3918/250/610/2/w/438/3918250610_2_1_1.jpg?ts=1661873101679",
                    fit: BoxFit.cover,
                  ),
                  title: Text("NY VARSITY Jackets , Buy Now"),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 5.5,
                            height: 5.5,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 20,
                                      blurStyle: BlurStyle.solid,
                                      spreadRadius: 1.5,
                                      color: Colors.greenAccent)
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Delivered on 31 Mar'22",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: OrderTracker(
                status: Status.delivered,
                activeColor: Colors.green,
                inActiveColor: Colors.grey,
                orderTitleAndDateList: orderList,
                shippedTitleAndDateList: shippedList,
                outOfDeliveryTitleAndDateList: outOfDeliveryList,
                deliveredTitleAndDateList: deliveredList,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Card(
                    color: bgcolor,
                    child: ListTile(
                      title: Text("Return/Exchange Order"),
                      subtitle: Text("Available tii 1 week"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                  Card(
                    color: bgcolor,
                    child: ListTile(
                      title: Text("Download Invoice"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                  Card(
                    color: bgcolor,
                    child: ListTile(
                        title: Text("Supplier"),
                        trailing: Text(
                          "Hiba Fashion",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
