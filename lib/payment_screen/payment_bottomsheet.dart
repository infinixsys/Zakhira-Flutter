import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/payment_screen/order_succes.dart';

class PaymentBottomSheetView extends StatefulWidget {
  const PaymentBottomSheetView({super.key});

  @override
  State<PaymentBottomSheetView> createState() => _PaymentBottomSheetViewState();
}

class _PaymentBottomSheetViewState extends State<PaymentBottomSheetView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils().getScreenSize().width,
      height: Utils().getScreenSize().height * 0.6,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 5.0, spreadRadius: 2.0)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.0),
              width: Utils().getScreenSize().width * 0.08,
              height: 5.0,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            SizedBox(
              height: Utils().getScreenSize().height * 0.04,
            ),
            ...List.generate(
                3,
                (index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: getPaymentButton(
                              "Pay With Upi",
                              "https://static.businessworld.in/article/article_extra_large_image/1589892172_FHqF6Z_UPI.jpg",
                              index),
                        ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }

  Widget getPaymentButton(String title, String image, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrderSucessScreen(),
            ));
      },
      child: Container(
        width: Utils().getScreenSize().width * 0.8,
        height: Utils().getScreenSize().height * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: selectedIndex == index ? orangeColor : Colors.grey,
                width: 2.0)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                Image.network(
                  image,
                  scale: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
