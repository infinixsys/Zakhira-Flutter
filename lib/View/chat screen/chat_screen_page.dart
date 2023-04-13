

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Utils/widgets.dart';
import 'package:zakira/View/chat%20screen/messages.dart';
import 'package:zakira/View/homeScreen/product_details_page.dart';
import 'package:zakira/sellerprofile/sellerprofile.dart';
import 'package:zakira/store/profile_view.dart';

class ChatScreenPage extends StatefulWidget {
  const ChatScreenPage({super.key});

  @override
  State<ChatScreenPage> createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  late DialogFlowtter _dialogFlowtter;

  final TextEditingController chatBarController = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DialogFlowtter.fromFile().then((instance) => _dialogFlowtter = instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: ListTile(
            title: Text(
              "Seller Name",
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20)),
            ),
            subtitle: Text(
              "Active",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            trailing: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelllerProfileScreen(),));
              },
              child: CircleAvatar(
                backgroundColor: orangeColor,
              ),
            ),
          )),
      body: Column(
        children: [
          SizedBox(
            height: Utils().getScreenSize().height * 0.025,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ProductDetailsScreen(
              //            longDiscription: "",
              //                       productCategory: "",
              //                       productId: "",
              //                       productImg: "",
              //                       productMoq: "",
              //                       productName: "",
              //                       productPrice: "",
              //                       productQty: "",
              //                       productStatus: "",
              //                       productType: "",
              //                       shortDiscription: "",
              //       ),
              //     ));
            },
            child: ListTile(
              leading: Container(
                width: Utils().getScreenSize().width * 0.18,
                height: Utils().getScreenSize().height * 0.09,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            "https://static.zara.net/photos///2022/I/0/2/p/3918/250/610/2/w/438/3918250610_2_1_1.jpg?ts=1661873101679"))),
              ),
              title: Text(
                "Order:#12345678",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontWeight: FontWeight.w500)),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Brown Jacket Oringinal",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.black))),
                  Text(
                    "Price",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          Expanded(child: MessagesScreen(messages: messages,)),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ListTile(
              leading: IconButton(onPressed: () {
                
              }, icon: Icon(Icons.add_circle)),
              title: Container(
                 width: Utils().getScreenSize().width * 0.95,
              height: Utils().getScreenSize().height * 0.058,
                child: SearchBarField(controller:chatBarController,myhint: "Type your messages",icon: Icon(Icons.message_outlined), )),
                trailing: IconButton(onPressed: () {
                  sendMessages(chatBarController.text);
                  chatBarController.clear();
                }, icon: Icon(Icons.arrow_circle_up_rounded,size: 38,color: orangeColor,)),
            ),
          )
         
        ],
      ),
    );
  }

  sendMessages (String text)async{
    if(text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please type your message")));
    }
    else{
      setState(() {
        addMessage(Message(
          text: DialogText(text: [text])
        ),true);
      });

      DetectIntentResponse response = await _dialogFlowtter.detectIntent(queryInput: QueryInput(text: TextInput(text: text)));

      if(response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }
  addMessage(Message message,[bool isUserMessage = false]){
    messages.add({
      "message":message,
      "isUserMessage":isUserMessage
    });
  }
}
