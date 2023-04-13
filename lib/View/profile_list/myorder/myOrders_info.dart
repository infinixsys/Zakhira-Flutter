import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/View/profile_list/myorder/my_order.dart';

class MyOrdersInfo extends StatelessWidget {
  const MyOrdersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>const MyOrderScreen(),));
      },
      child: Container(
        width: Utils().getScreenSize().width,
        height: Utils().getScreenSize().height * 0.13,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Orders",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.black)
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getMyOrderColumn("1", "Unpaid"),
                getMyOrderColumn("0", "Processing"),
                getMyOrderColumn("0", "Shipped"),
                getMyOrderColumn("0", "Reviews"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getMyOrderColumn(String number, String text) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }
}
