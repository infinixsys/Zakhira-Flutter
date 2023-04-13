import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/homeScreen/product_details_page.dart';
import 'package:zakira/productCategoryView/product_category.dart';

class ProductsItemsView extends StatefulWidget {
  const ProductsItemsView({super.key});

  @override
  State<ProductsItemsView> createState() => _GridViewProductScreenState();
}

class _GridViewProductScreenState extends State<ProductsItemsView> {
  final double itemHeight =
      (Utils().getScreenSize().height - kToolbarHeight - 30) / 2;
  final double itemWidth = Utils().getScreenSize().width / 2;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ProductDetailsScreen(
        //            longDiscription: "",
        //                             productCategory: "",
        //                             productId: "",
        //                             productImg: "",
        //                             productMoq: "",
        //                             productName: "",
        //                             productPrice: "",
        //                             productQty: "",
        //                             productStatus: "",
        //                             productType: "",
        //                             shortDiscription: "",
        //       ),
        //     ));
      },
      child: Column(
        children: [
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
                  (index) => Container(
                        color: Colors.white,
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
                                          "https://images.ctfassets.net/wcfotm6rrl7u/6Na4EbXlSkTpqPpJcLT2Uw/d576d75f92936452b59ddcf765cf9d7e/nokia_Earbuds_Lite_BH405-og_image.jpg"),
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
                      ))
            ],
          )
        ],
      ),
    );
  }
}
