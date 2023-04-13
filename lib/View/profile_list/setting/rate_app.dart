import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      height: Utils().getScreenSize().height * 0.6,
      width: Utils().getScreenSize().width,
      decoration: BoxDecoration(
      
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        children: [
          Container(
            height: Utils().getScreenSize().height * 0.25,
            width: Utils().getScreenSize().width * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://babich.biz/content/images/2016/11/12.png"))),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Rate Now",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Thank you for using the ZAKIRA.com app.\nwe value your feedback",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          getCustomizedButton(
              Utils().getScreenSize().width * 0.7,
              Utils().getScreenSize().height * 0.06,
              Text("Yes,I love it!",style: TextStyle(color: Colors.white),),
              orangeColor,
              Border()),
              SizedBox(
            height:10,
          ),
          TextButton(onPressed: () {
            
          }, child: Text("I have an issue",style: TextStyle(color: Colors.grey,fontSize: 17),))
        ],
      ),
    );
  }
}
