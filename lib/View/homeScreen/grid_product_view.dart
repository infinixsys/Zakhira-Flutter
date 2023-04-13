import 'package:flutter/material.dart';
import 'package:zakira/Services/all_product_api.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/productCategoryView/product_category.dart';

class GridViewProductScreen extends StatefulWidget {
  const GridViewProductScreen({super.key});

  @override
  State<GridViewProductScreen> createState() => _GridViewProductScreenState();
}

class _GridViewProductScreenState extends State<GridViewProductScreen> {
  final double itemHeight =
      (Utils().getScreenSize().height - kToolbarHeight - 30) / 2;
  final double itemWidth = Utils().getScreenSize().width / 2;
  ProductService productService = ProductService();

  // *******

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // productService.fetchAllProductData();
    productService.fetchHomeProductData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productService.fetchHomeProductData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: productService.homeProduct!.results!.length.compareTo(1),
            padding: const EdgeInsets.all(10.0),
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                childAspectRatio: itemWidth / itemHeight),
            itemBuilder: (context, index) {
              final price =
                  productService.homeProduct!.results![index].price!.toDouble();
              final isTaxIncluded =
                  productService.homeProduct!.results![index].isTaxIncluded ==
                      "yes";
              final taxList = productService.homeProduct!.results![index].tax;
              final taxParcentage =
                  isTaxIncluded ? taxList![index].taxPercentage!  : 0;
              final finalPrice =
                  isTaxIncluded ? price * (1 - taxParcentage / 100) : price;

              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductByCategoryScreen(
                          productName: productService
                              .homeProduct!.results![index].productName
                              .toString(),
                          productType: productService
                              .homeProduct!.results![index].productType
                              .toString(),
                          longDiscription: "",
                          productCategory: "",
                          productId: productService
                              .homeProduct!.results![index].productId
                              .toString(),
                          productImg: productService
                              .homeProduct!.results![index].image
                              .toString(),
                          productMoq: productService
                              .homeProduct!.results![index].moq
                              .toString(),
                          productPrice: finalPrice.toString(),
                          productQty: productService
                              .homeProduct!.results![index].stockCount
                              .toString(),
                          productStatus: "",
                          shortDiscription: "",
                        ),
                      ));
                },
                child: Container(
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
                            image: DecorationImage(
                                image: productService.homeProduct!
                                        .results![index].image!.isNotEmpty
                                    ? NetworkImage(productService
                                        .homeProduct!.results![index].image
                                        .toString())
                                    : const NetworkImage(
                                        "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          productService
                              .homeProduct!.results![index].productName
                              .toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                        child: Text(
                          "₹${finalPrice.toString()}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                        child: Text(
                          "${productService.homeProduct!.results![index].moq.toString()} pieces (MOQ)",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
