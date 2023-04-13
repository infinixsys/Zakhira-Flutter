import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';

class ReviewVeiw extends StatelessWidget {
  const ReviewVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.0,),
        Container(
          width: Utils().getScreenSize().width,
          height: Utils().getScreenSize().height * 0.3,
          color: Colors.white,
          child: SizedBox(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: Utils().getScreenSize().width * 0.2,
                    height: Utils().getScreenSize().height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://images.ctfassets.net/wcfotm6rrl7u/6Na4EbXlSkTpqPpJcLT2Uw/d576d75f92936452b59ddcf765cf9d7e/nokia_Earbuds_Lite_BH405-og_image.jpg"))),
                  ),
                  title: Text(
                    "Nokia Power Earbuds Lite Wireless earbuds and charging carry case.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Black-Big screen"),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("₹40,5000 * 1")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "₹40,5000",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Order complete",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Utils().getScreenSize().height*0.035,),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: getCustomizedButton(
                        Utils().getScreenSize().width,
                        Utils().getScreenSize().height * 0.05,
                      Text(
                              "Write a review",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                        orangeColor,
                        Border()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}