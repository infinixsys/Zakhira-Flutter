import 'package:flutter/material.dart';

class ProccessingDetailScreen extends StatelessWidget {
  const ProccessingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         ListTile(
              title: Text(
                "Processing Time",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              subtitle: Text(
                "The Amount of time from order to dispatch",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "15 days",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "1+ Places",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "30 days",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "100+ Places",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
      ],
    );
  }
}