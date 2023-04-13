import 'package:flutter/material.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/store/homeitems/new_products.dart';
import 'package:zakira/store/homeitems/seller_info.dart';
import 'package:zakira/store/homeitems/show_case.dart';

class HomeStore extends StatefulWidget {
  const HomeStore({super.key});

  @override
  State<HomeStore> createState() => _HomeStoreState();
}

class _HomeStoreState extends State<HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Card(
                  elevation: 0,
                  child: ListTile(
                    leading: Icon(
                      Icons.store_outlined,
                      color: Colors.blue,
                    ),
                    title: Text(
                      "Unique Trading",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text("Gurugram,India"),
                    trailing: getCustomizedButton(
                        Utils().getScreenSize().width * 0.3,
                        Utils().getScreenSize().height * 0.04,
                        Text(
                          "Follow",
                          style: TextStyle(color: Colors.white),
                        ),
                        orangeColor,
                        Border()),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                getCustomContainer(
                    "https://www.devicemagic.com/wp-content/uploads/2020/10/person_using_smartphone-2.jpg",
                    "New Products"),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    width: Utils().getScreenSize().width,
                    height: Utils().getScreenSize().height * 0.48,
                    decoration: BoxDecoration(color: Colors.white),
                    child: NEwProducts()),
                    getCustomContainer("https://images.unsplash.com/photo-1502307444187-44d62a6a80af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fG5pZ2h0JTIwbGFtcHxlbnwwfHwwfHw%3D&w=1000&q=80", "Showcase"),
                    ShowCaseView(),
                    SizedBox(height: 10,),
                    SellerInfo()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getCustomContainer(String image, String text) {
    return Container(
      width: Utils().getScreenSize().width,
      height: Utils().getScreenSize().height * 0.08,
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
      child: Container(
        width: Utils().getScreenSize().width,
        height: Utils().getScreenSize().height * 0.08,
        decoration: BoxDecoration(color: Colors.black54),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
