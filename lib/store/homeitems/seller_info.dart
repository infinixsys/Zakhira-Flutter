import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';

class SellerInfo extends StatelessWidget {
  const SellerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils().getScreenSize().width,
      height: Utils().getScreenSize().height * 0.3,
      padding: const EdgeInsets.only(left: 18.0, top: 18),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: Utils().getScreenSize().width * 0.25,
                height: Utils().getScreenSize().height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(120),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/002/410/613/small/business-man-making-thumb-up-holding-best-seller-gold-medal-sign-logo-illustration-free-vector.jpg"))),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Unique Trading",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Country:",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "State:",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "City:",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "India",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Delhi",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "New Delhi",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
