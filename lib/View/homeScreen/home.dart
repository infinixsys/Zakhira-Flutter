import 'dart:convert';
import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zakira/Models/seller_story_model.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/View/Cart/cart_provider.dart';
import 'package:zakira/View/Cart/cart_screen.dart';
import 'package:zakira/View/ShortsScreen/add_caption_screen.dart';

import 'package:zakira/View/homeScreen/grid_product_view.dart';
import 'package:zakira/View/homeScreen/product_Detail/store_visit.dart';
import 'package:zakira/View/homeScreen/searchbar_field.dart';
import 'package:zakira/View/startsellingonzakira/postproducts.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart' as badges;

import '../../store/store_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterCart cart = FlutterCart();
  // *****Story Api***
  bool isLoading = false;
  File? _videoFile;
  int itemCount = 0;

  void updateBadge() {
    setState(() {
      itemCount = cart.getCartItemCount();
    });
  }

  SellerStoryModel? sellerStoryModel;

  String apiurl = Config.baseapiUrl + Config.SellerStoryApi;

  // Future<SellerStoryModel?> fetchSellerStoryData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     final response = await http.get(Uri.parse(apiurl));
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       setState(() {
  //         isLoading = false;
  //         print(response.body);
  //       });

  //       sellerStoryModel = SellerStoryModel.fromJson(data);
  //       return sellerStoryModel;
  //     } else {
  //       throw Exception("Failed to load data ");
  //     }
  //   } catch (error) {
  //     setState(() {
  //       isLoading = false;
  //       print("Failed to load data ");
  //     });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateBadge();
    // fetchSellerStoryData();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Marketplace",
            style:
                GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 24)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchBarScreen(),
                      ));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black87,
                )),
            const SizedBox(
              width: 8,
            ),
            Consumer<CartProvider>(
              builder: (context, value, child) {
                return badges.Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  badgeAnimation: badges.BadgeAnimation.slide(),
                  badgeContent: Text(
                    '${cartProvider.itemCount.toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CartScreen(productQuantity: ""),
                            ));
                      },
                      icon: Icon(Icons.shopping_cart_outlined)),
                );
              },
            ),
            const SizedBox(
              width: 8,
            ),
            PopupMenuButton(
              icon: const Icon(Icons.add_box_outlined),
              itemBuilder: (context) => [
                PopupMenuItem(
                    onTap: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostProductsScreen(),
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
            const SizedBox(
              width: 8,
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.transparent,
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          children: [
                            ...List.generate(
                              6,
                              (index) => Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const StoreView(),
                                          ));
                                    },
                                    child: const CircleAvatar(
                                      maxRadius: 30,
                                      backgroundImage: NetworkImage(
                                        "https://media.wired.com/photos/5fb2cc575c9914713ead03de/1:1/w_1358,h_1358,c_limit/Gear-Apple-MacBook-Air-top-down-SOURCE-Apple.jpg",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Buy Laptop",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 13.0),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              SizedBox(
                height: Utils().getScreenSize().height * 0.015,
              ),
              const GridViewProductScreen(),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
  // ---video selct---

// ----- video picker----
  Future getVideoPicker() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _videoFile = File(pickedFile.path);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Video selected")));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCaptionScreen(videoPath: _videoFile!),
            ));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Video not selected")));
      }
    });
  }
}
