import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Services/get_profile_service.dart';
import 'package:zakira/Services/otp_api_service.dart';
import 'package:zakira/View/Cart/cart_screen.dart';
import 'package:zakira/View/ShortsScreen/add_caption_screen.dart';

import 'package:zakira/View/ShortsScreen/shorts_screen.dart';
import 'package:zakira/View/chat%20screen/messanger_screen.dart';
import 'package:zakira/View/home_Screen.dart';
import 'package:zakira/View/profile_info/profile_header_widget.dart';
import 'package:zakira/View/profile_info/tabview/seller_products.dart';
import 'package:zakira/View/profile_info/tabview/shorts_view.dart';
import 'package:zakira/View/startsellingonzakira/postproducts.dart';
import 'package:http/http.dart' as http;

import '../../Models/profile_model.dart';

class ProfileBaseScreen extends StatefulWidget {
  String productQuantity;
   ProfileBaseScreen({super.key,
  required this.productQuantity
  });

  @override
  State<ProfileBaseScreen> createState() => _ProfileBaseScreenState();
}

class _ProfileBaseScreenState extends State<ProfileBaseScreen>
    with SingleTickerProviderStateMixin {
  late TabController profileTabController;

// *******

  ProfileModel? profileModel;
  File ?_videoFile;

  bool isLoading = false;
  String apiUrl = Config.baseapiUrl + Config.getProfile;

  // Future<ProfileModel?> fetchProfileData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       setState(() {
  //         print(response.body);
  //         isLoading = false;
  //       });
  //       profileModel = ProfileModel.fromJson(data);
  //       return profileModel;
  //     } else {
  //       throw Exception("Failed to load data ");
  //     }
  //   } catch (error) {
  //     setState(() {
  //       isLoading = false;
  //       throw Exception("Failed to load data ");
  //     });
  //   }
  // }

  // *****

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileTabController = TabController(length: 2, vsync: this);
    // fetchProfileData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    profileTabController.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Profile",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            centerTitle: false,
            elevation: 0,
            actions: [
              PopupMenuButton(
                icon: const Icon(Icons.add_box_outlined),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                     PostProductsScreen(),
                              ));
                        });
                      },
                      value: 0,
                      child: const Text("Post")),
                  PopupMenuItem(
                      onTap: () {
                       getVideoPicker();
                      },
                      value: 1,
                      child: const Text("Short")),
                ],
              ),
              PopupMenuButton(
                padding: const EdgeInsets.only(bottom: 1.5),
                icon: const Icon(Icons.menu),
                itemBuilder: (context) => [
                  _buildPopupMenuItem("Home", () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    });
                  }),
                  _buildPopupMenuItem("Messanger", () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Massengercreen(),
                          ));
                    });
                  }),
                  _buildPopupMenuItem("Cart", () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(
                              productQuantity: widget.productQuantity,
                            ),
                          ));
                    });
                  }),
                  _buildPopupMenuItem("Shorts", () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShortsScreen(),
                          ));
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (context, _) {
                  return [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ProfileHeaderWidget(
                            name: "Jack",
                            email: "Jack@gmail.com",
                            phoneNumber:
                                "11232544555",
                            shopeName:
                                "Jack Wears",
                            img: "https://media.wired.com/photos/5fb2cc575c9914713ead03de/1:1/w_1358,h_1358,c_limit/Gear-Apple-MacBook-Air-top-down-SOURCE-Apple.jpg",
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: Column(
                  children: <Widget>[
                    Material(
                      color: Colors.white,
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey[400],
                        indicatorWeight: 1,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(
                            icon: Image.asset(
                              'assets/box.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const Tab(
                            icon: Icon(Icons.video_collection_rounded),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [SellerProductsScreen(), ShortsViewScrenn()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title, onTap) {
    return PopupMenuItem(
      onTap: onTap,
      child: Text(title),
    );
  }

   
// ----- video picker----
  Future getVideoPicker() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _videoFile = File(pickedFile.path);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Video selected")));
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddCaptionScreen(videoPath: _videoFile!),));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Video not selected")));
      }
    });
  }
}
