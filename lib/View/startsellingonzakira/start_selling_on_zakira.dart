import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/startsellingonzakira/textfield_ragistor_as_seller.dart';

class StartSellingOnZakira extends StatefulWidget {
  const StartSellingOnZakira({super.key});

  @override
  State<StartSellingOnZakira> createState() => _StartSellingOnZakiraState();
}

class _StartSellingOnZakiraState extends State<StartSellingOnZakira> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        elevation: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Ragister as seller", style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [TextFieldRagistorAsSeller()],
          ),
        ),
      ),
    );
  }
}
