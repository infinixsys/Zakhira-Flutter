import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';

class TradeAssuranceScreen extends StatelessWidget {
  const TradeAssuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils().getScreenSize().width,
      height: Utils().getScreenSize().height * 0.15,
      decoration: BoxDecoration(
         ),
      child: ListTile(
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
                      fontWeight: FontWeight.w500, color: Colors.grey[500]),
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
                      fontWeight: FontWeight.w500, color: Colors.grey[500]),
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
    );
  }
}
