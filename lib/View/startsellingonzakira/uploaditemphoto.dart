import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:zakira/Utils/Utils.dart';

class UploadItemPhoto extends StatefulWidget {
 late File images;
  UploadItemPhoto({
    super.key,
    required this.images
  });

  @override
  State<UploadItemPhoto> createState() => _UploadItemPhotoState();
}

class _UploadItemPhotoState extends State<UploadItemPhoto> {
  // ---- Image Picker--
  

  Future<void> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Image Selected")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No Image Selected")));
    }
    setState(() {
      widget.images =File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Select Image",
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            getImage(ImageSource.gallery);
          },
          child: Container(
            height: Utils().getScreenSize().height * 0.33,
            width: Utils().getScreenSize().width,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
            child: Column(
              children: [
                widget.images != null
                    ? Image.file(
                        widget.images,
                        height: Utils().getScreenSize().height * 0.31,
                        width: Utils().getScreenSize().width,
                      )
                    : Image.network(
                        "https://cdn.pixabay.com/photo/2017/11/10/05/24/add-2935429_960_720.png",
                        fit: BoxFit.cover,
                        height: Utils().getScreenSize().height * 0.31,
                        width: Utils().getScreenSize().width,
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
