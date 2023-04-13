import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';

class BuyerCentral extends StatelessWidget {
  const BuyerCentral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Zakira Buyer Central", style: GoogleFonts.poppins()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                width: Utils().getScreenSize().width,
                height: Utils().getScreenSize().height * 0.4,
                decoration: BoxDecoration(color: orangeColor),
                child: Center(
                    child: Text(
                  "Source,pay for, and\nship your goods on\nZakira.com",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "What is Zakira.com",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Shopping is an activity in which a customer browses the available goods or services presented by one or more retailers with the potential intent to purchase a suitable selection of them.",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: Utils().getScreenSize().height * 0.06,
              ),
              Center(
                  child: Column(
                children: [
                  Text(
                    "190+",
                    style: TextStyle(
                        color: orangeColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  Text("countries and regions")
                ],
              )),
              SizedBox(
                height: Utils().getScreenSize().height * 0.06,
              ),
              Center(
                  child: Column(
                children: [
                  Text(
                    "40+",
                    style: TextStyle(
                        color: orangeColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  Text("industries")
                ],
              )),
              SizedBox(
                height: Utils().getScreenSize().height * 0.06,
              ),
              Center(
                  child: Column(
                children: [
                  Text(
                    "5,900+",
                    style: TextStyle(
                        color: orangeColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  Text("product catagories")
                ],
              )),
              SizedBox(
                height: Utils().getScreenSize().height * 0.06,
              ),
              Center(
                  child: Column(
                children: [
                  Text(
                    "16+",
                    style: TextStyle(
                        color: orangeColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  Text("languages translated")
                ],
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                width: Utils().getScreenSize().width,
                color: Color(0xfff2f3f7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "New to sourcing on\nZakira.com?",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                          "Shopping is an activity in which a customer browses the available goods or services presented by one or more retailers with the potential intent to purchase a suitable selection of them."),
                    ),
                    getListtile(
                        Text("Find product and sellers",style: TextStyle(color: Colors.black),),
                        CircleAvatar(
                          backgroundColor: orangeColor,
                        ),
                        Text(
                          "Step 1",
                          style: TextStyle(color: orangeColor),
                        )),
                    getListtile(
                        Text("Connect with sellers",style: TextStyle(color: Colors.black),),
                        CircleAvatar(
                          backgroundColor: orangeColor,
                        ),
                        Text(
                          "Step 2",
                          style: TextStyle(color: orangeColor),
                        )),
                    getListtile(
                        Text("Place and protected order",style: TextStyle(color: Colors.black),),
                        CircleAvatar(
                          backgroundColor: orangeColor,
                        ),
                        Text(
                          "Step 3",
                          style: TextStyle(color: orangeColor),
                        )),
                    getListtile(
                        Text("Pay on Zakira.com",style: TextStyle(color: Colors.black),),
                        CircleAvatar(
                          backgroundColor: orangeColor,
                        ),
                        Text(
                          "Step 4",
                          style: TextStyle(color: orangeColor),
                        )),
                    getListtile(
                        Text("Ship and recieve your goods",style: TextStyle(color: Colors.black),),
                        CircleAvatar(
                          backgroundColor: orangeColor,
                        ),
                        Text(
                          "Step 5",
                          style: TextStyle(color: orangeColor),
                        )),
                        SizedBox(
                      height: 20,
                    ),
                    InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Center(
                  child: getCustomizedButton(
                      Utils().getScreenSize().width * 0.5,
                      Utils().getScreenSize().height * 0.06,
                      Text(
                        "Learn more",
                        style: TextStyle(color: orangeColor),
                      ),
                      Colors.white,
                      Border.all(color: orangeColor)),
                ),
              ),
            ),
            SizedBox(height: 25,),
                  ],
                ),
              ),
              
              Container(
                padding: EdgeInsets.only(top: 35,left: 18,right: 10),
                width: Utils().getScreenSize().width,
                
                decoration: BoxDecoration(color: Color(0xfff5bb36)),
                child: Center(
                    child: Column(
                      children: [
                        Text(
                  "Order with confidence",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15,),
                        Text(
                  "Ensure product quality and on time delivery",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                        Text(
                  "Trade Assurance,the Zakira.com order",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                        Text(
                  "protection service",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20,),
                InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Center(
                  child: getCustomizedButton(
                      Utils().getScreenSize().width * 0.5,
                      Utils().getScreenSize().height * 0.06,
                      Text(
                        "Learn more",
                        style: TextStyle(color:Color(0xfff5bb36) ),
                      ),
                      Colors.white,
                      Border()),
                ),
              ),
                ),
                SizedBox(height: 25,),
                      ],
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }

  getListtile(Widget widget, CircleAvatar avatar, Text text) {
    return ListTile(
      title: text,
      subtitle: widget,
      leading: avatar,
    );
  }
}
