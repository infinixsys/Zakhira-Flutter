import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Verification/forgot_password/forgot_pass_textfield.dart';
import 'package:zakira/Verification/login_page.dart';
import 'package:zakira/Verification/otp_page.dart';

import '../../Services/change_password_service.dart';

class NewPasswordScreen extends StatefulWidget {
  String mobileNumber;
  NewPasswordScreen({super.key, required this.mobileNumber});

  @override
  State<NewPasswordScreen> createState() => _SugnUpPageState();
}

class _SugnUpPageState extends State<NewPasswordScreen> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Utils().getScreenSize().height * 0.035,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Please enter your \nNew Password.",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "We protect our community by making sure \nThat nobody can see your password..",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: Utils().getScreenSize().width * 0.12,
              ),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                          width: Utils().getScreenSize().width * 0.9,
                          height: Utils().getScreenSize().height * 0.1,
                          child: TextField(
                            controller: newPasswordController,
                            decoration: InputDecoration(
                              hintText: "New Password",
                              labelText: "New Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                            ),
                          ))),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                          width: Utils().getScreenSize().width * 0.9,
                          height: Utils().getScreenSize().height * 0.1,
                          child: TextField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                            ),
                          ))),
                ],
              ),
              SizedBox(
                height: Utils().getScreenSize().height * 0.18,
              ),
              Column(
                children: [
                  Center(
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : getCustomButton("Submit", () async {
                            if (newPasswordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Password not match")));
                            } else {
                              setState(() {
                                isLoading == true;
                              });
                              final response = await ChangePasswordService()
                                  .changePassword(widget.mobileNumber,
                                      newPasswordController.text);
                              setState(() {
                                isLoading = false;
                              });
                              if (response.statusCode == 200) {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Alert'),
                                      content:
                                          // ignore: prefer_const_constructors
                                          Text("Password Successfully Changed"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginPage(),
                                                ),
                                                (route) => false);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Failed to change password'),
                                  ),
                                );
                              }
                            }
                          }),
                  ),
                  SizedBox(
                    height: Utils().getScreenSize().height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.manage_accounts,
                          size: 30,
                        ),
                        SizedBox(height: Utils().getScreenSize().height * 0.1),
                        const Text(
                          "We never share this with anyone and it \n won't be on your profile.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15.0),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
