import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zakira/Services/all_product_api.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/profile_list/manageinventory/update_product.dart';
import 'package:zakira/View/startsellingonzakira/postproducts.dart';

class PricingUpadte extends StatefulWidget {
  String productName;
  String productStatus;
  String productQty;
  String productPrice;
  String productMoq;
  String productCategory;
  String productType;
  String productImg;
  String productId;
  String shortDiscription;
  String longDiscription;

  PricingUpadte({
    super.key,
    required this.productName,
    required this.productStatus,
    required this.productQty,
    required this.productPrice,
    required this.productMoq,
    required this.productCategory,
    required this.productType,
    required this.productImg,
    required this.productId,
    required this.shortDiscription,
    required this.longDiscription,
  });

  @override
  State<PricingUpadte> createState() => _PricingUpadteState();
}

class _PricingUpadteState extends State<PricingUpadte> {
  ProductService productService = ProductService();

  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productService.fetchAllProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Price",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                   Text(
                    "₹${widget.productPrice}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              trailing: TextButton.icon(
                  onPressed: () => navigateToEditPage(),
                  icon: const Icon(Icons.update_rounded),
                  label: const Text("Update")),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Net Proceed Estimate",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      "____",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded)),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                "Low Price",
                style: TextStyle(color: Colors.grey[500]),
              ),
              trailing: Text("₹${widget.productPrice} + ₹0.00"),
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Featured Offer Price",
                style: TextStyle(color: Colors.grey[500]),
              ),
              trailing:  Text("₹${widget.productPrice}+ ₹0.00"),
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Low Price",
                style: TextStyle(color: Colors.grey[500]),
              ),
              trailing: Text("₹${widget.productPrice} + ₹0.00"),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Competitive offers",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                     Text(
                      "1 from ₹${widget.productPrice}",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded)),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Business price",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    "₹",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              trailing: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.update_rounded),
                  label: const Text("Update")),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                "Quantity Discount",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(
              thickness: 15.0,
              color: searchBarcolor,
            ),
            SizedBox(
              height: Utils().getScreenSize().height * 0.04,
            ),
            ActionChip(
                onPressed: () => navigateToEditPage(),
                backgroundColor: orangeColor,
                padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: Utils().getScreenSize().width * 0.2),
                elevation: 4.0,
                disabledColor: orangeColor,
                label: const Text(
                  "Upadte Product",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }

  void navigateToEditPage() async {
    final route = MaterialPageRoute(
      builder: (context) => UpdateProduct(
        productName: widget.productName,
        productStatus: widget.productStatus,
        productCategory: widget.productCategory,
        productMoq: widget.productMoq,
        productPrice: widget.productPrice,
        productQty: widget.productQty,
        productType: widget.productType,
        productImg: widget.productImg,
        productId: widget.productId,
            shortDiscription: widget.shortDiscription,
                      longDiscription: widget.longDiscription,
      ),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
  }
}
