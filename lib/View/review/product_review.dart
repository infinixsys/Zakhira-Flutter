import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Reviews",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
                6,
                (index) => Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              "T",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          title: const Text("Amit"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "05/11/2022",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                            leading: Container(
                              width: 1.0,
                              height: Utils().getScreenSize().height,
                              color: Colors.grey,
                            ),
                            title: const Text(
                              "The product is amazing you can't afford a product of this range anywhere.Just go for it.",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
