import 'package:flutter/material.dart';
import 'package:zakira/Services/all_product_api.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/homeScreen/product_details_page.dart';
import 'package:zakira/productCategoryView/product_category.dart';

class RecomendedScreen extends StatefulWidget {
  const RecomendedScreen({super.key});

  @override
  State<RecomendedScreen> createState() => _RecomendedScreenState();
}

class _RecomendedScreenState extends State<RecomendedScreen> {
  final double itemHeight =
      (Utils().getScreenSize().height - kToolbarHeight - 30) / 2;
  final double itemWidth = Utils().getScreenSize().width / 2;
  ProductService productService = ProductService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productService.fetchAllProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("Reccomended from this supplier"),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: productService.fetchAllProductData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: productService.allProduct!.results!.length,
                padding: const EdgeInsets.all(10.0),
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    childAspectRatio: itemWidth / itemHeight),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              productName: productService
                                  .allProduct!.results![index].productName
                                  .toString(),
                              productType: productService
                                  .allProduct!.results![index].productType
                                  .toString(),
                              longDiscription: "",
                              productCategory: "",
                              productId: productService
                                  .allProduct!.results![index].productId
                                  .toString(),
                              productImg: productService
                                  .allProduct!.results![index].image
                                  .toString(),
                              productMoq: productService
                                  .allProduct!.results![index].moq
                                  .toString(),
                              productPrice: productService
                                  .allProduct!.results![index].price
                                  .toString(),
                              productQty: productService
                                  .allProduct!.results![index].stockQuantity
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
                                    image: NetworkImage(productService
                                        .allProduct!.results![index].image
                                        .toString()),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              productService
                                  .allProduct!.results![index].productName
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
                              "₹${productService.allProduct!.results![index].price.toString()}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10),
                            child: Text(
                              "${productService.allProduct!.results![index].moq.toString()} pieces (MOQ)",
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
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
