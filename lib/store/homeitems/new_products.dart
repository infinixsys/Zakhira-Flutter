import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/homeScreen/product_details_page.dart';

class NEwProducts extends StatefulWidget {
  const NEwProducts({super.key});

  @override
  State<NEwProducts> createState() => _NEwProductsState();
}

class _NEwProductsState extends State<NEwProducts> {
  final double itemHeight =
      (Utils().getScreenSize().height - kToolbarHeight - 30) / 2;
  final double itemWidth = Utils().getScreenSize().width / 2;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 15,
      padding: const EdgeInsets.all(10.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: (itemWidth / itemHeight),
      children: [
        ...List.generate(
            6,
            (index) => InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>  ProductDetailsScreen(
                    //            longDiscription: "",
                    //                 productCategory: "",
                    //                 productId: "",
                    //                 productImg: "",
                    //                 productMoq: "",
                    //                 productName: "",
                    //                 productPrice: "",
                    //                 productQty: "",
                    //                 productStatus: "",
                    //                 productType: "",
                    //                 shortDiscription: "",
                    //       ),
                    //     ));
                  },
                  child: Container(
                    width: Utils().getScreenSize().width * 0.25,
                    height: Utils().getScreenSize().height * 0.08,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Utils().getScreenSize().width,
                          height: Utils().getScreenSize().height * 0.14,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/og-airpods-max-202011?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1603996970000"),
                                  fit: BoxFit.cover)),
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, top: 10),
                              child: Text(
                                "₹40,500",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2.0, top: 10),
                              child: Text(
                                "/1.0 pieces",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
      ],
    );
  }
}
