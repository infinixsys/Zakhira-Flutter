import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:http/http.dart' as http;

import '../../Services/s3_api_service.dart';

class EditProfileScreen extends StatefulWidget {
  String? name;
  String? email;
  String? phone;
  String? img;
  EditProfileScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.img});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  File? image;
  final SimpleS3 _simpleS3 = SimpleS3();
  S3Service s3service = S3Service();
  bool isApiCallProcess = true;

  // late String imageUrl;

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
        print("Image Selected");
      } else {
        print("Something Went Wrong");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.name!;
    emailController.text = widget.email!;
    phoneController.text = widget.phone!;
    s3service.fetchS3Data();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Edit Profile"),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.black,
              size: 30.0,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                getS3UpdateProfileImageUrl(image!);
                updateProfile();
                
              },
              icon: const Icon(
                Icons.check,
                color: Colors.blue,
                size: 30.0,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Center(
                    child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => pickImage(),
                      child: Container(
                        width: Utils().getScreenSize().width * 0.2,
                        height: Utils().getScreenSize().height * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: ClipOval(
                          child: image != null
                              ? Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.person,
                                  size: 50.0,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: InkWell(
                        onTap: () {},
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
                      ),
                    )
                  ],
                )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: "Name"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: "Email"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      enabled: false,
                      controller: phoneController,
                      decoration:
                          const InputDecoration(labelText: "Phone Number"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getDetailsColumn(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 17.0, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        Divider(
          color: Colors.grey[400],
          thickness: 0.8,
        )
      ],
    );
  }
// ********************

  Future<void> updateProfile() async {
    if (_formKey.currentState!.validate()) {
      final profile = {
        'name': nameController.text,
        'email': emailController.text,
      };

      try {
        final response = await http.put(
          Uri.parse(Config.baseapiUrl + Config.updateProfileApi),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(profile),
        );
        print(response.body);
        if (response.statusCode == 200) {
          final updatedProfile = jsonDecode(response.body);
          Future.delayed(
            const Duration(seconds: 3),
            () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Profile Update SuccessFull"),
                    content: const Text("Your  Profile Upadted."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Navigate to the login page
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        } else {
          throw Exception('Failed to update profile');
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to update profile: $e'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  // Future<String?> _uploadImage(File image) async {
  //   final uri = Uri.parse(Config.baseapiUrl + Config.updateProfileApi);
  //   final request = http.MultipartRequest('PUT', uri);
  //   request.files.add(
  //     await http.MultipartFile.fromPath(
  //       'image',
  //       image.path,
  //       filename: 'profile.jpg',
  //     ),
  //   );
  //   final response = await request.send();
  //   if (response.statusCode == 200) {
  //     final responseJson = jsonDecode(await response.stream.bytesToString());
  //     return responseJson['url'];
  //   } else {
  //     throw Exception('Failed to upload image');
  //   }
  // }

  // ---- Update Image---

  Future<String?> getS3UpdateProfileImageUrl(File file) async {
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
        file,
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
}
