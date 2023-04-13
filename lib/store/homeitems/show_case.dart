

import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/homeScreen/product_details_page.dart';

class ShowCaseView extends StatefulWidget {
  const ShowCaseView({super.key});

  @override
  State<ShowCaseView> createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCaseView> {
  final double itemHeight =
      (Utils().getScreenSize().height - kToolbarHeight - 30) / 2;
  final double itemWidth = Utils().getScreenSize().width / 2;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: GridView.count(
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10.0),
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
        children: [
          ...List.generate(
              10,
              (index) => InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductDetailsScreen(
                  //      longDiscription: "",
                  //                   productCategory: "",
                  //                   productId: "",
                  //                   productImg: "",
                  //                   productMoq: "",
                  //                   productName: "",
                  //                   productPrice: "",
                  //                   productQty: "",
                  //                   productStatus: "",
                  //                   productType: "",
                  //                   shortDiscription: "",
                  // ),));
                },
                child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Utils().getScreenSize().width,
                            height: Utils().getScreenSize().height * 0.22,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://pyxis.nymag.com/v1/imgs/9d7/a2e/d3c1e85ae2db240d4c7b31b35a09067095-best-headphones-lede.rsquare.w1200.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "NY Best Headphones only Availble Here.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400,color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              "₹40,500",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              "1.0 pieces (MOQ)",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ))
        ],
      ),
    );
  }
}
