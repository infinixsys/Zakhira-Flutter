import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(child: Text("No Favorite added",style: TextStyle(color: Colors.grey,fontSize: 20),),)
        ],
      ),
    );
  }
}