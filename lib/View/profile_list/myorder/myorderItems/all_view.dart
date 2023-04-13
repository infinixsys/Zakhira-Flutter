import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/payment_screen/payment_bottomsheet.dart';

class AllView extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
   const AllView({super.key,required this.scaffoldkey});

  @override
  State<AllView> createState() => _AllViewState();
}

class _AllViewState extends State<AllView> {
  
  
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
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const[
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
                      Row(
                        children: const[
                         Icon(Icons.check),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "₹On-time Dispatch Guarantee",
                            style: TextStyle( color: Colors.black),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 38.0),
                        child: Text(
                          "Waiting for payment",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Utils().getScreenSize().height*0.035,),
                InkWell(
                  onTap: () {
                   widget.scaffoldkey
                  .currentState
                  ?.showBottomSheet(
                    backgroundColor: Colors.black12,
                    elevation: 0,
                    (context) => const PaymentBottomSheetView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: getCustomizedButton(
                        Utils().getScreenSize().width,
                        Utils().getScreenSize().height * 0.05,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Make payment",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
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
