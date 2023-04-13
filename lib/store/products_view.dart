import 'package:flutter/material.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/homeScreen/grid_product_view.dart';
import 'package:zakira/store/products_items/products_items.dart';

class ProductsViewPage extends StatefulWidget {
  const ProductsViewPage({super.key});

  @override
  State<ProductsViewPage> createState() => _ProductsViewPageState();
}

class _ProductsViewPageState extends State<ProductsViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            getFilterButtons("Recommended"),
            getFilterButtons("New"),
            getFilterButtons("Orders"),
            getFilterButtons("Suplier selected")
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [ProductsItemsView()],
        ),
      ),
    );
  }

  Widget getFilterButtons(
    String text,
  ) {
    return InkWell(
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Icon(
            Icons.filter_alt_outlined,
            size: 15,
          )
        ],
      ),
    );
  }
}
