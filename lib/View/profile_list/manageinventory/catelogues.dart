import 'package:flutter/material.dart';
import 'package:zakira/View/profile_list/manageinventory/update_product.dart';

class CatelougeScreen extends StatefulWidget {
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
  CatelougeScreen({
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
  State<CatelougeScreen> createState() => _CatelougeScreenState();
}

class _CatelougeScreenState extends State<CatelougeScreen> {
  bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "ADD More Images",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt, color: Colors.orange)),
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
