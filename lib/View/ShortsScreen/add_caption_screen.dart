import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:video_player/video_player.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Services/s3_api_service.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:zakira/View/homeScreen/home.dart';
import 'package:zakira/View/home_Screen.dart';

class AddCaptionScreen extends StatefulWidget {
  File videoPath;
  AddCaptionScreen({super.key, required this.videoPath});

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  bool isApiCallProcess = true;
  final SimpleS3 _simpleS3 = SimpleS3();
  S3Service s3service = S3Service();

  // ----- video upload ------
  void _uploadVideo(String _title, String _caption) async {
    final url = Uri.parse(Config.baseapiUrl + Config.uploadShorts);

    try {
      final request = http.MultipartRequest('POST', url);
      request.headers.addAll({'Content-Type': 'multipart/form-data'});

      request.files.add(
          await http.MultipartFile.fromPath('video', widget.videoPath.path));

      request.fields['tittle'] = _title;
      request.fields['description'] = _caption;

      final response = await request.send();
      print(response.request);

      if (response.statusCode == 200) {
        final responseBody =
            jsonDecode(await utf8.decodeStream(response.stream));
        print(responseBody);
        var videoUrl = responseBody['video'];
        print(videoUrl);
        print('Error uploading video. Server response: ${response.statusCode}');

        print('Video url: $videoUrl');

        // TODO: Handle success
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("VideoUpload Sucessfull")));
      } else {
        final responseBody = await response.stream.bytesToString();
        print(
            'Upload failed with status ${response.statusCode}: $responseBody');
        // TODO: Handle error
      }
    } catch (error) {
      print('Error uploading video: $error');
    }
  }

  TextEditingController songController = TextEditingController();

  late VideoPlayerController _videoPlayerController;
  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s3service.fetchS3Data();

    _videoPlayerController = VideoPlayerController.file(widget.videoPath);

    setState(() {});
    _videoPlayerController.initialize();
    _videoPlayerController.play();

    _videoPlayerController.setLooping(true);

    _videoPlayerController.setVolume(5.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [],
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: widget.videoPath != null
                      ? VideoPlayer(_videoPlayerController)
                      : const Icon(
                          Icons.video_collection_rounded,
                          size: 68,
                          color: Colors.grey,
                        ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      TextInputField(
                          controller: songController,
                          myIcon: Icons.music_note,
                          myLabelText: "Title"),
                      const SizedBox(
                        height: 15,
                      ),
                      TextInputField(
                          controller: captionController,
                          myIcon: Icons.closed_caption_off_rounded,
                          myLabelText: "Caption")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _uploadVideo(songController.text, captionController.text);
                  getS3ShortsVideoUrl(widget.videoPath);
                  Future.delayed(
                    const Duration(seconds: 3),
                    () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Video Upload Successful"),
                            content:
                                const Text("Your Video Upload successful."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Navigate to the login page
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomeScreen(),
                                      ),
                                      (route) => false);
                                },
                                child: const Text("Ok"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                child: getCustomizedButton(
                    Utils().getScreenSize().width * 0.5,
                    Utils().getScreenSize().height * 0.07,
                    const Text(
                      "POST",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Colors.pink,
                    const Border()),
              )
            ],
          ),
        ),
      ),
    );
  }

  // -----vidoe upload ---

  Future<String?> getS3ShortsVideoUrl(File file) async {
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
