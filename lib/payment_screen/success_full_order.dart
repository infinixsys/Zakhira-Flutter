import 'package:flutter/material.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/homeScreen/home.dart';
import 'package:zakira/View/home_Screen.dart';

class SuccessFullOrderScreen extends StatefulWidget {
  const SuccessFullOrderScreen({super.key});

  @override
  State<SuccessFullOrderScreen> createState() => _SuccessFullOrderScreenState();
}

class _SuccessFullOrderScreenState extends State<SuccessFullOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 80.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Center(
              child: Text(
            "Thank You!",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 10.0,
          ),
          const Center(
              child: Text(
            "Thank You For Placing Order.",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
          )),
          const SizedBox(
            height: 25.0,
          ),
          ActionChip(
              elevation: 4.0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.0),
              backgroundColor: orangeColor,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false);
              },
              disabledColor: orangeColor,
              label: const Text("Continue Shopping",
                  style: TextStyle(fontSize: 18.0, color: Colors.white)))
        ],
      ),
    );
  }
}
