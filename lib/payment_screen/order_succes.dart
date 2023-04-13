import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:lottie/lottie.dart';
import 'package:zakira/payment_screen/order_invoice.dart';
import 'package:zakira/payment_screen/success_full_order.dart';

class OrderSucessScreen extends StatefulWidget {
  const OrderSucessScreen({super.key});

  @override
  State<OrderSucessScreen> createState() => _OrderSucessScreenState();
}

class _OrderSucessScreenState extends State<OrderSucessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessFullOrderScreen(),
          ),
          (route) => false);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
              child: LottieBuilder.network(
                  "https://assets1.lottiefiles.com/packages/lf20_0df8dldf.json")),
          Positioned(
              bottom: Utils().getScreenSize().height * 0.35,
              right: Utils().getScreenSize().height * 0.10,
              child: Center(
                  child: Text(
                "Order Successfull",
                style: Theme.of(context).textTheme.titleLarge,
                textScaleFactor: 1.4,
              )))
        ],
      ),
    );
  }
}
