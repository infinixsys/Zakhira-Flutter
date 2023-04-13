import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/store/store_view.dart';

class StoreVisit extends StatefulWidget {
  const StoreVisit({super.key});

  @override
  State<StoreVisit> createState() => _StoreVisitState();
}

class _StoreVisitState extends State<StoreVisit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, top: 5.0),
      width: Utils().getScreenSize().width,
      height: Utils().getScreenSize().height * 0.3,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        tabBackColor,
        Colors.white,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Seller Name",
            maxLines: 2,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            "Manufacturer,Trading Company",
            maxLines: 2,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15,top: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: getCustomizedButton(
                      Utils().getScreenSize().width * 0.42,
                      Utils().getScreenSize().width * 0.095,
                      const Text("Follow",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500)),
                      Colors.white,
                      Border.all(color: Colors.black)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const  StoreView(),));
                  },
                  child: getCustomizedButton(
                      Utils().getScreenSize().width * 0.42,
                      Utils().getScreenSize().width * 0.095,
                      const Text("Visit Store",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500)),
                      Colors.white,
                      Border.all(color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
