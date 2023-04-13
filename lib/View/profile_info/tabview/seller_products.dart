import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/homeScreen/product_details_page.dart';

class SellerProductsScreen extends StatefulWidget {
  const SellerProductsScreen({super.key});

  @override
  State<SellerProductsScreen> createState() => _RecomendedScreenState();
}

class _RecomendedScreenState extends State<SellerProductsScreen> {
  final double itemHeight =
      (Utils().getScreenSize().height - kToolbarHeight - 30) / 2;
  final double itemWidth = Utils().getScreenSize().width / 2;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text("My Products",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87)),
        ),
        GridView.count(
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //            ProductDetailsScreen(
                        //                longDiscription: "",
                        //             productCategory: "",
                        //             productId: "",
                        //             productImg: "",
                        //             productMoq: "",
                        //             productName: "",
                        //             productPrice: "",
                        //             productQty: "",
                        //             productStatus: "",
                        //             productType: "",
                        //             shortDiscription: "",
                        //            ),
                        //     ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Utils().getScreenSize().width,
                              height: Utils().getScreenSize().height * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://miot-global.com/uploads/CatalogueImage/pvm_earbuds2s%20(2)_19463_1625299859.jpg"),
                                      fit: BoxFit.cover)),
                                 
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "NY Best Jackets only Availble Here.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0, top: 10),
                              child: Text(
                                "₹40,500",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
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
        )
      ],
    );
  }
}
