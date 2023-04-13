import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Services/ragister_api_service.dart';
import 'package:zakira/Services/s3_api_service.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Verification/login_page.dart';
import 'package:http/http.dart' as http;

class UserinfoScreen extends StatefulWidget {
  late String? mobileNo;
  UserinfoScreen({super.key, required this.mobileNo});

  @override
  State<UserinfoScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<UserinfoScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;
  File? selectedImage;
  File tempImage = File(AutofillHints.photo);
  bool isApiCallProcess = true;
  final SimpleS3 _simpleS3 = SimpleS3();
  S3Service s3service = S3Service();
  String imageUrl = "";

  // ---- Image Picker--

  Future<void> getImage(ImageSource source) async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (images != null) {
        selectedImage = File(images.path);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Image Selected")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("No Image Selected")));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.mobileNo != null) {
      phoneController.text = widget.mobileNo!;
    }
    s3service.fetchS3Data();
    s3service.fetchS3BaseUrlData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: getBackButton()),
              Padding(
                padding: EdgeInsets.only(
                    top: Utils().getScreenSize().height * 0.001),
                child: Center(
                    child: InkWell(
                  onTap: () {
                    getImage(ImageSource.gallery);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: Utils().getScreenSize().width * 0.2,
                        height: Utils().getScreenSize().height * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: ClipOval(
                          child: selectedImage != null
                              ? Image.file(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.person,
                                  size: 50.0,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          width: Utils().getScreenSize().width * 0.06,
                          height: Utils().getScreenSize().height * 0.03,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(55)),
                          child: Center(
                              child: Icon(
                            Icons.photo_camera,
                            color: orangeColor,
                            size: 16.0,
                          )),
                        ),
                      )
                    ],
                  ),
                )),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      decoration:
                          const InputDecoration(labelText: "First Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill the above field";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(labelText: "Last Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill the above field";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: emailNameController,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill the above field";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration:
                          const InputDecoration(labelText: "Phone Number"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill the above field";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: " Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill the above field";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration:
                          const InputDecoration(labelText: "Confirm Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill the above field";
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Utils().getScreenSize().height * 0.09,
              ),
              Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : getCustomButton("Submit", () async {
                        setState(() {
                          isLoading = true;
                        });
                        imageUrl = getS3ProfileImageUrl().toString();

                        if (firstNameController.text == "" &&
                            lastNameController.text == "" &&
                            emailNameController.text == "" &&
                            passwordController.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Fill the all Fields")));
                          setState(() {
                            isLoading = false;
                          });
                          // ignore: unnecessary_null_comparison
                        } else if (imageUrl.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            ragisterWithPhone(
                                firstNameController.text,
                                lastNameController.text,
                                emailNameController.text,
                                passwordController.text,
                                phoneController.text,
                                imageUrl);

                            Future.delayed(
                              const Duration(seconds: 3),
                              () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title:
                                          const Text("Registration Successful"),
                                      content: const Text(
                                          "Your registration was successful."),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Navigate to the login page
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage(),
                                              ),
                                              (route) => false,
                                            );
                                          },
                                          child: const Text("Ok"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Password not matched")));
                          }
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            ragisterWithPhone(
                                firstNameController.text,
                                lastNameController.text,
                                emailNameController.text,
                                passwordController.text,
                                phoneController.text,
                                "");

                            Future.delayed(
                              const Duration(seconds: 3),
                              () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    return AlertDialog(
                                      title:
                                          const Text("Registration Successful"),
                                      content: const Text(
                                          "Your registration was successful."),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Navigate to the login page
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage(),
                                              ),
                                              (route) => false,
                                            );
                                          },
                                          child: const Text("Ok"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                                 setState(() {
                            isLoading = false;
                          });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Password not matched")));
                          }
                        }
                      }),
              ),
              SizedBox(height: Utils().getScreenSize().height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.manage_accounts,
                    size: 30,
                  ),
                  SizedBox(height: Utils().getScreenSize().height * 0.04),
                  const Text(
                    "We never share this with anyone and it \n won't be on your profile.",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> getS3ProfileImageUrl() async {
    setState(() {
      isApiCallProcess = true;
    });

    try {
      final s3Model = s3service.fetchS3Data();

      // Check if the s3model object is not null
      if (s3service.s3model == null) {
        throw Exception('S3Model is null');
      }

      // Check if the results object is not null
      if (s3service.s3model!.results == null) {
        throw Exception('S3Model results is null');
      }

      final bucketName = s3service.s3model!.results!.bucketName;
      final poolId = s3service.s3model!.results!.poold;

      // Check if the _simpleS3 object is not null
      if (_simpleS3 == null) {
        throw Exception('_simpleS3 is null');
      }

      final s3ImageUrl = await _simpleS3.uploadFile(
        selectedImage!,
        bucketName.toString(),
        poolId.toString(),
        AWSRegions.apSouth1,
        debugLog: false,
        s3FolderPath: "zakhira/",
        accessControl: S3AccessControl.publicRead,
      );
      setState(() {
        isApiCallProcess = false;
      });
      print("Image Upload Successfull");
      print(s3ImageUrl);

      return s3ImageUrl;
    } catch (e) {
      print("Failed Upload: $e");
      return null;
    }
  }
  // -----ragister APi--

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var client = http.Client();

  Future<void> ragisterWithPhone(String firstname, String lastName,
      String email, String password, String phonenumber, String image) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse(Config.baseapiUrl + Config.registerApi);
      Map body = {
        "firstName": firstname,
        "lastName": lastName,
        "email": email,
        "password": password,
        "number": phonenumber,
        "image": image
      };

      print(body);

      var response =
          await client.post(url, body: jsonEncode(body), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        // print(response.body);
        final json = jsonDecode(response.body);
        if (json['code'] == 200) {
          var token = json['results']['accessToken'];
          print(token);
          final SharedPreferences? prefs = await _prefs;
        } else {
          throw jsonDecode(response.body)['message'] ?? "Unknown error";
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknown error";
      }
    } catch (e) {
      "Unknown error";
    }
  }
}
