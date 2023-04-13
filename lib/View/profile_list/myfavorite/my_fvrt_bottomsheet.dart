import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';

class MyFvrtBottomSheet extends StatelessWidget {
  const MyFvrtBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils().getScreenSize().height * 0.4,
      width: Utils().getScreenSize().width,
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Text("Shopping list",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 15,),
      
            TextButton(onPressed: () {
              
            }, child: Text("+ Add a new shopping list",style: TextStyle(fontSize: 18,color: orangeColor),)),
            Divider(color: Colors.grey,),
            InkWell(
              onTap: () {
                
              },
              child: ListTile(
                title: Text("all(0)"),
                trailing: Icon(Icons.check,color:orangeColor),
              ),
            ),
            Divider(color: Colors.grey,),
            InkWell(
              onTap: () {
                
              },
              child: ListTile(
                title: Text("Ungrouped(0)"),
                
              ),
            ),
            Divider(color: Colors.grey,),
            InkWell(
              onTap: () {
                
              },
              child: ListTile(
                title: Text("Bucket(0)"),
                
              ),
            )
      
      
          ],
        ),
      ),
    );
  }
}
