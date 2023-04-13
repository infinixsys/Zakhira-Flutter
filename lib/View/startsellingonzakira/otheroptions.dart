import 'package:flutter/material.dart';

class OtherOptionsScreen extends StatefulWidget {
  const OtherOptionsScreen({super.key});

  @override
  State<OtherOptionsScreen> createState() => _OtherOptionsScreenState();
}

class _OtherOptionsScreenState extends State<OtherOptionsScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      "Location",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text("Delhi,india - 110011"),
                  ),
                ),
                
                // ListTile(
                //             leading: Checkbox(
                //               value: isSelected,
                //               onChanged: (bool? value) {
                //                 if (value != null) {
                //                   setState(() {
                //                     isSelected = value;
                //                   });
                //                 }
                //               },
                //             ),
                //             title: Text("Sale this item",style: TextStyle(fontWeight: FontWeight.w500),),
                //             subtitle: Text("you'll recieve bids on this item"),
                            
                //           ),
                // ListTile(
                //             leading: Checkbox(
                //               value: isSelected,
                //               onChanged: (bool? value) {
                //                 if (value != null) {
                //                   setState(() {
                //                     isSelected = value;
                //                   });
                //                 }
                //               },
                //             ),
                //             title: Text("Instant sale price",style: TextStyle(fontWeight: FontWeight.w500),),
                //             subtitle: Text("Enter the price for which the item will be instantly sold"),
                            
                //           ),
              ],
            );
  }
}