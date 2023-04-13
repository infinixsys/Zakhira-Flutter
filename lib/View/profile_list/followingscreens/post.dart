import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
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