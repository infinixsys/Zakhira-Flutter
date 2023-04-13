import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';

class TextFieldRagistorAsSeller extends StatefulWidget {
  const TextFieldRagistorAsSeller({super.key});

  @override
  State<TextFieldRagistorAsSeller> createState() =>
      _TextFieldRagistorAsSellerState();
}

class _TextFieldRagistorAsSellerState extends State<TextFieldRagistorAsSeller> {
  int yesValue = 0;
  int noValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        const Text(
          "Tell us a little about yourself. This will help us give you the best experiance.",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          "Phone Number",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: SizedBox(
            height: Utils().getScreenSize().height * 0.09,
            child: IntlPhoneField(
              decoration: InputDecoration(
                hintText: "Phone Number",
                filled: true,
                fillColor: bgcolor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bgcolor)),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Ragistered company name",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Utils().getScreenSize().height * 0.07,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Ragistered company name",
              filled: true,
              fillColor: bgcolor,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: bgcolor)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "GST Number",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Utils().getScreenSize().height * 0.07,
          child: TextField(
            decoration: InputDecoration(
              hintText: "GST Number",
              filled: true,
              fillColor: bgcolor,
              enabledBorder:  const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: bgcolor)),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
         const Text(
          "Address",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: Utils().getScreenSize().height * 0.07,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Address",
              filled: true,
              fillColor: bgcolor,
              enabledBorder:  const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: bgcolor)),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
            const Text(
          "Upload Store Images",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            getContainer(),
            getContainer(),
            getContainer(),
          ],
        ),
        Row(children: [
          Text(
            "are you an exporter?",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "yes",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Radio<int>(
            activeColor: Colors.blueAccent,
            value: 3,
            groupValue: yesValue,
            onChanged: (int? value) {
              if (value != null) {
                setState(() {
                  this.yesValue = value;
                });
              }
            },
          ),
          Text(
            "no",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Radio<int>(
            activeColor: Colors.blueAccent,
            value: 3,
            groupValue: noValue,
            onChanged: (int? value) {
              if (value == null) {
                setState(() {
                  this.noValue = value!;
                });
              }
            },
          ),
        ]),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: GestureDetector(
            onTap: () {},
            child: getCustomizedButton(
                Utils().getScreenSize().width * 0.88,
                Utils().getScreenSize().width * 0.12,
                Text("Apply",
                    style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600 )),
                orangeColor,
                Border()),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
            child: Text(
          "By submiting you agree with Zakira.com Terms & Conditions.",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        )),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget getContainer(){
    return Container(
              width: Utils().getScreenSize().width*0.2,
              height: Utils().getScreenSize().height*0.08,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(child: Icon(Icons.add),),
            );
  }
}
