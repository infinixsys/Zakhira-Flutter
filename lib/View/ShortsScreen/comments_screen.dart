import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Utils/widgets.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController commentController = TextEditingController();
  List<dynamic> comments = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Utils().getScreenSize().height * 0.7,
        width: Utils().getScreenSize().width,
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Center(
              child: Text("Comments",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 20, color: Colors.grey))),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, int index) {
                
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: orangeColor,
                    
                  ),
                  title: const Text("User Name",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                  subtitle: Text(comments[index].toString(),style: const TextStyle(color: Colors.black,fontSize: 15),),
                  trailing: const Icon(CupertinoIcons.heart_fill),
                );
              },
            )),
            Row(
              children: [
                Container(
                    width: Utils().getScreenSize().width * 0.85,
                    child: SearchBarField(
                        controller: commentController,
                        myhint: "Comment",
                        icon: const Icon(Icons.comment))),
                IconButton(
                    onPressed: () {
                      if(commentController.text == null){
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Write Comment")));
                }
                     else{
                       setState(() {
                        comments.add(commentController.text);
                      commentController.clear();
                      });
                     }
                    },
                    icon: Icon(
                      Icons.arrow_circle_up_rounded,
                      size: 38,
                      color: orangeColor,
                    ))
              ],
            )
          ],
        ));
  }
}
