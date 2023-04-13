import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/startsellingonzakira/postproducts.dart';
import 'package:zakira/View/startsellingonzakira/start_selling_on_zakira.dart';

class StartSellingScreen extends StatefulWidget {
  const StartSellingScreen({super.key});

  @override
  State<StartSellingScreen> createState() => _StartSellingScreenState();
}

class _StartSellingScreenState extends State<StartSellingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: orangeColor),
        elevation: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Start Selling on Zakira", style: GoogleFonts.poppins()),
      ),
      body: 
            Container(
              width: Utils().getScreenSize().width,
              height: Utils().getScreenSize().height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://media.istockphoto.com/id/545580304/photo/shaking-hands.jpg?s=612x612&w=0&k=20&c=oajQl5wQ0MhnoutbF7YtBjUVmU5Ck1EE_QJ_PiMQYi8="))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 20),
                    child: Text(
                      "Post products on\nZakira.com for free",
                      style: GoogleFonts.alike(fontSize: 30, color: Colors.black,fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18,top: 25),
                    child: Text(
                      "Apply your 30 day free trial with\nprivate domain 50 products\npostings. Get started to see what\nyour products exhibitions could look\nlike on Zakira.com.",
                      style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Container(
                      height: Utils().getScreenSize().height*0.4,
                      width: Utils().getScreenSize().width,
                      color: Color(0xff393071).withOpacity(0.7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StartSellingOnZakira(),));
                        },
                        child: getCustomizedButton(
                            Utils().getScreenSize().width * 0.88,
                            Utils().getScreenSize().width * 0.12,
                            Text("Ragister as Seller",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16)),
                            Colors.white,
                            Border()),
                      ),
                      SizedBox(height: 20,),
                      Text("Or", style: GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
                      SizedBox(height: 20,),
                         GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PostProductsScreen(),));
                        },
                        child: getCustomizedButton(
                            Utils().getScreenSize().width * 0.88,
                            Utils().getScreenSize().width * 0.12,
                            Text("Post Products",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16)),
                            Colors.white,
                            Border()),
                      ),
                    
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
         ,
    );
  }
}
