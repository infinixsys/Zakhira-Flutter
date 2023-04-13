import 'package:flutter/material.dart';

class ClosedView extends StatelessWidget {
  const ClosedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/udr1.png"),
        Text(
          "No orders yet,",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
