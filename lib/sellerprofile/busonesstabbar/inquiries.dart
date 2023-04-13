import 'package:flutter/material.dart';

class InquiriesPage extends StatefulWidget {
  const InquiriesPage({super.key});

  @override
  State<InquiriesPage> createState() => _InquiriesPageState();
}

class _InquiriesPageState extends State<InquiriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Center(child: Text("No Queries",style: TextStyle(color: Colors.grey),))
        ],
      ),
    );
  }
}