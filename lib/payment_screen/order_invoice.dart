import 'package:flutter/material.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/home_Screen.dart';
import 'package:zakira/payment_screen/trade_assurance.dart';

class OrderInvoiceScreen extends StatefulWidget {
  const OrderInvoiceScreen({super.key});

  @override
  State<OrderInvoiceScreen> createState() => _OrderInvoiceScreenState();
}

class _OrderInvoiceScreenState extends State<OrderInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        elevation: 0,
        title: const Text(
          "Orders Details",
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Divider(
              color: Colors.grey[500],
            ),
            getRowWidget("items(s) total:", "₹4,760.12"),
            const SizedBox(
              height: 8.0,
            ),
            getRowWidget("items(s) total:", "₹4,760.12"),
            const SizedBox(
              height: 8.0,
            ),
            getRowWidget("Total:", "₹4,760.12"),
            const SizedBox(
              height: 8.0,
            ),
            Divider(
              color: bgcolor,
              thickness: 15.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            getRowWidget("Shipping Method", "Express"),
            const SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.grey[500],
            ),
            const SizedBox(
              height: 10.0,
            ),
            getRowWidget("Carrier", "Seller's Shipping Method 1"),
            const SizedBox(
              height: 10.0,
            ),
            Divider(
              color: bgcolor,
              thickness: 15.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const TradeAssuranceScreen(),
            Divider(
              color: bgcolor,
              thickness: 15.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            getRowWidget("Order no:", "9645145255415415"),
            const SizedBox(
              height: 8.0,
            ),
            getRowWidget("Order submitted:", "31/02/2023"),
            Divider(
              color: Colors.grey[500],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dispatch date:",
                      style:
                          TextStyle(fontSize: 15.0, color: Colors.grey[600])),
                  const Text(
                    "15 days after full amount collected\nis credited.",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Divider(
              color: bgcolor,
              thickness: 15.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 8.0),
              child: Text("Recipient",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600])),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: const[
                  Text("Karan Kumar Arora",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "98152XXXXX",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                "A7-sector-5 new delhi -11004X",
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRowWidget(String title, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 17.0, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
