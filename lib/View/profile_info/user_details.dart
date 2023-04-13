import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:zakira/Models/profile_model.dart';
import 'package:zakira/Services/get_profile_service.dart';

class UserDetailsView extends StatefulWidget {
  final String name;
  final String shopeName;
  final String phoneNumber;
  final String email;
  UserDetailsView(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.shopeName});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        getUserDetailsRow(
            Icon(
              Icons.email_outlined,
              color: Colors.black,
              size: 20,
            ),
            widget.email),
        getUserDetailsRow(
            Icon(Icons.store_mall_directory_outlined,
                color: Colors.black, size: 20),
            widget.shopeName),
        getUserDetailsRow(
            Icon(Icons.phone_android_outlined, color: Colors.black, size: 20),
            widget.phoneNumber),
      ],
    );
  }

  Widget getUserDetailsRow(Icon icon, String text) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8.0,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    );
  }
}
