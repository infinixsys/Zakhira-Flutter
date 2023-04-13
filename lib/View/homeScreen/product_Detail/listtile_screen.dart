import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/sellerprofile/sellerprofile.dart';

class ListTileScreen extends StatefulWidget {
  const ListTileScreen({super.key});

  @override
  State<ListTileScreen> createState() => _ListTileScreenState();
}

class _ListTileScreenState extends State<ListTileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.delivery_dining,
                  color: Colors.black,
                ),
                title: Text(
                  "Shipping",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  "4 yrs CN",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.payment_rounded,
                color: Colors.black,
              ),
              title: Text(
                "Payments",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Container(
                    width: Utils().getScreenSize().width * 0.3,
                    height: Utils().getScreenSize().height * 0.025,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCYcr0tM2BF1Xl7_xffSTsy6God_EC7aVNsg&usqp=CAU"))),
                  ),
                  SizedBox(height: 5,),
                  Text("Enjoy encrypted and secure payments.")
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.shield,
                color: Colors.black,
              ),
              title: Text(
                "Trade Assurance",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Protect your Zakira Orders",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 18,
                      ),
                      Text(
                        "On Time Dispatch Gurantee",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 18,
                      ),
                      Text(
                        "Refund Policy",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
