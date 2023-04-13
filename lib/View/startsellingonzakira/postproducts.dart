// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:zakira/Models/all_category_model.dart';
import 'package:zakira/Models/all_product.dart';
import 'package:zakira/Models/all_sub_category_model.dart';
import 'package:zakira/Models/s3_model.dart';
import 'package:zakira/Models/tax_model.dart';
import 'package:zakira/Services/add_product.dart';
import 'package:zakira/Services/all_category.dart';
import 'package:zakira/Services/all_product_api.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Services/s3_api_service.dart';
import 'package:zakira/Services/tax_service.dart';
import 'package:zakira/Services/upload_images_api.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:zakira/Utils/widgets.dart';
import 'package:zakira/View/home_Screen.dart';
import 'package:zakira/View/startsellingonzakira/iteminfo.dart';
import 'package:zakira/View/startsellingonzakira/otheroptions.dart';
import 'package:zakira/View/startsellingonzakira/uploaditemphoto.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PostProductsScreen extends StatefulWidget {
  String? productName;
  PostProductsScreen({super.key, this.productName});

  @override
  State<PostProductsScreen> createState() => _PostProductsScreenState();
}

class _PostProductsScreenState extends State<PostProductsScreen> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountOriceController = TextEditingController();
  TextEditingController shortDescriptionController = TextEditingController();
  TextEditingController longDescriptionController = TextEditingController();
  TextEditingController stockQuantityController = TextEditingController();
  TextEditingController moqController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController stockQtyController = TextEditingController();
  TextEditingController stocStatusController = TextEditingController();

  // File? images;
  List<AllProduct> productList = [];
  bool isApiCallProcess = false;
  File? selectedImage;
  bool uploaded = false;
  final SimpleS3 _simpleS3 = SimpleS3();
  S3Service s3service = S3Service();
  String imageUrl = "";
  File? image;
  bool isLoading = false;
  TaxService taxService = TaxService();
  AddProductService addProductService = AddProductService();
  ProductService productService = ProductService();
  List<TaxModel> taxData = [];
  List<String> selectedTax = [];
  List<String> selectedTaxIds = [];
  Map<String?, dynamic>? categoryChosen = null;
  String? categoryId;
  bool isTaxIncluded = false;
  double taxParecentage = 0;
  double taxValue = 0.0;
  TaxModel taxModel = TaxModel();
  Map<String?, dynamic>? subCategoryChosen = null;
  String? selectedSubCategory;

  @override
  void initState() {
    super.initState();
    s3service.fetchS3Data();
    s3service.fetchS3BaseUrlData();

    if (selectedStatus == "unlimited") {
      stockQtyController.text = "0";
    }
    getAllCategory();
    taxService.fetchTaxData();
  }

// iMAGE pICKER---
// ---- Image Picker--

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

  // ----Multi Image Picker-----

  // --- DropDown Items---
  final List<String> items = [
    'simple',
    'variable',
  ];
  final List<String> itemStatus = ['unlimited', 'outOfStock', "limitedStock"];

  final List<String> taxItmes = ['Inclusive', 'Exclusive'];
  String? selectedTaxItem;
  String? selectedValue;

  String? selectedStatus;
  late Future<List<AllCategoryModel>> _categoriesFuture;
  String? selectedId;

  // Widget buildGridView() {
  //   return GridView.builder(
  //     itemCount: multiImages.length,
  //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //         maxCrossAxisExtent: 150.0),
  //     itemBuilder: (context, index) {
  //       return Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Image.file(multiImages[index]),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: orangeColor),
        elevation: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Post Products", style: GoogleFonts.poppins()),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg"),
                    ),
                    title: Text("Rick Flare"),
                    subtitle: Text("Listing on Marketplace"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          "Select Image",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          getImage(ImageSource.gallery);
                        },
                        child: Container(
                          height: Utils().getScreenSize().height * 0.33,
                          width: Utils().getScreenSize().width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Center(
                              child: Column(children: [
                            Expanded(
                                child: selectedImage != null
                                    ? Image.file(selectedImage!)
                                    : const Icon(Icons.image))
                          ])),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Information",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SearchBarField(
                            controller: itemNameController,
                            myhint: "Item Name",
                            icon: const Icon(Icons.keyboard)),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: searchBarcolor,
                              borderRadius: BorderRadius.circular(18.0)),
                          child: ListTile(
                            title: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                              hint: const Text(
                                "Category",
                                style: TextStyle(fontSize: 14),
                              ),
                              items: allCategoryList
                                  .map((dynamic item) => DropdownMenuItem(
                                      value: item as Map,
                                      child: Text(
                                        item['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      )))
                                  .toList(),
                              value: categoryChosen,
                              onChanged: (dynamic value) async {
                                setState(() {
                                  // categoryId=value['id'].toString();
                                  print("Id : $value");
                                  categoryId = value['id'].toString();
                                  print("category Id : $categoryId");
                                  categoryChosen = value;
                                  print("categoryChosen : $categoryChosen");

                                  print("click");
                                });

                                if (value != null) {
                                  List subCategoryList =
                                      await getAllSubCategory(
                                          categoryId.toString());
                                  setState(() {
                                    allSubCategoryList = subCategoryList;
                                  });
                                }
                              },
                              buttonStyleData: const ButtonStyleData(
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            )),
                          ),
                        ),

                        allSubCategoryList.isEmpty
                            ? SizedBox(height: 10.0)
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6.0),
                                    decoration:
                                        BoxDecoration(color: searchBarcolor),
                                    child: ListTile(
                                      title: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                        hint: const Text(
                                          "Select Sub Category",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        items: allSubCategoryList
                                            .map((dynamic item) =>
                                                DropdownMenuItem(
                                                    value: item as Map,
                                                    child: Text(
                                                      item['name'].toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )))
                                            .toList(),
                                        value: subCategoryChosen,
                                        onChanged: (dynamic value) {
                                          setState(() {
                                            selectedSubCategory =
                                                value['id'].toString();
                                            subCategoryChosen = value!;
                                          });
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          height: 40,
                                          width: 140,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: priceController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              filled: true,
                              fillColor: searchBarcolor,
                              hintText: "Price",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: const Icon(Icons.currency_rupee)),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: discountOriceController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              filled: true,
                              fillColor: searchBarcolor,
                              hintText: "Discount Price",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: const Icon(Icons.discount)),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        FutureBuilder(
                          future: taxService.fetchTaxData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              // Use the data from the snapshot to build your UI
                              return MultiSelectDropDown(
                                hint: "Select Tax",
                                onOptionSelected:
                                    (List<ValueItem> selectedOptions) {
                                  setState(() {
                                    selectedTax = selectedOptions
                                        .map(
                                            (option) => option.value.toString())
                                        .toList();

                                    taxValue = 0.0;
                                    for (final taxId in selectedTax) {
                                      final tax = snapshot.data!.results!
                                          .firstWhere((t) => t.id == taxId);
                                      taxValue += tax.taxPercentage! / 100;
                                    }
                                    taxValue *=
                                        double.tryParse(priceController.text) ??
                                            0.0;
                                  });
                                },
                                options: taxService.taxModel!.results!
                                    .map((tax) => ValueItem(
                                        label:
                                            "${tax.taxName} (${tax.taxPercentage})",
                                        value: tax.id.toString()))
                                    .toList(),
                                selectionType: SelectionType.multi,
                                chipConfig:
                                    const ChipConfig(wrapType: WrapType.wrap),
                                borderColor: searchBarcolor,
                                backgroundColor: searchBarcolor,
                                dropdownHeight: 300,
                                optionTextStyle: const TextStyle(fontSize: 16),
                                selectedOptionIcon:
                                    const Icon(Icons.check_circle),
                              );
                            } else if (snapshot.hasError) {
                              // Handle the error case
                              print(snapshot.error);
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else {
                              return const Center(
                                child: Text("Add Tax"),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: searchBarcolor,
                              borderRadius: BorderRadius.circular(18.0)),
                          child: CheckboxListTile(
                            title: Text("Incluede Tax"),
                            value: isTaxIncluded,
                            onChanged: (newValue) {
                              setState(() {
                                isTaxIncluded = newValue!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: shortDescriptionController,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            filled: true,
                            fillColor: searchBarcolor,
                            hintText: "Short Description",
                            helperText: "Keep it Short",
                          ),
                          maxLines: 6,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: longDescriptionController,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            filled: true,
                            fillColor: searchBarcolor,
                            hintText: "Long Description",
                          ),
                          maxLines: 14,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: searchBarcolor,
                              borderRadius: BorderRadius.circular(18.0)),
                          child: ListTile(
                            title: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                              hint: const Text(
                                "Product Type",
                                style: TextStyle(fontSize: 14),
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      )))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: searchBarcolor,
                              borderRadius: BorderRadius.circular(18.0)),
                          child: ListTile(
                            title: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                              hint: const Text(
                                "Product Status",
                                style: TextStyle(fontSize: 14),
                              ),
                              items: itemStatus
                                  .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      )))
                                  .toList(),
                              value: selectedStatus,
                              onChanged: (value) {
                                setState(() {
                                  selectedStatus = value as String;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            enabled:
                                selectedStatus == "unlimited" ? false : true,
                            controller: stockQtyController,
                            maxLength: 4,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                filled: true,
                                fillColor: searchBarcolor,
                                hintText: "Stock Quantity",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                prefixIcon: const Icon(
                                    Icons.production_quantity_limits_rounded)),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: moqController,
                          maxLength: 4,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            filled: true,
                            fillColor: searchBarcolor,
                            hintText: "MOQ",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 20.0,
                        // ),
                      ],
                    ),
                  ),
                  const OtherOptionsScreen(),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
          Center(
            child: ActionChip(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  // Get the form data
                  try {
                    final productName = itemNameController.text.trim();

                    final category = categoryId;
                    final productType = selectedValue;
                    final moq = moqController.text.trim();
                    final status = statusController.text.trim();
                    final stockStatus = selectedStatus;
                    final stockQty = stockQtyController.text.trim();
                    final shortDescription =
                        shortDescriptionController.text.trim();
                    final longDescription =
                        longDescriptionController.text.trim();
                    final price = double.tryParse(priceController.text);

                    // Validate the form data
                    if (productName.isEmpty ||
                            // imageUrl!.isEmpty ||
                            category!.isEmpty ||
                            productType!.isEmpty ||
                            moq.isEmpty ||
                            // status.isEmpty ||
                            stockStatus!.isEmpty ||
                            selectedStatus == "unlimited"
                        ? stockQty.isNotEmpty
                        : stockQty.isEmpty ||
                            shortDescription.isEmpty ||
                            longDescription.isEmpty ||
                            price == null) {
                      setState(() {
                        isLoading = false;
                      });
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Alert'),
                            content: const Text("Please fill all the fields"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      String? imageUrl = await getS3ImageUrl(selectedImage!) ??
                          "image is null";
                      String slicedImageUrl = imageUrl.substring(43);

                      if (imageUrl.isNotEmpty) {
                        // ignore: use_build_context_synchronously
                        await addProductService.addProductWithApi(
                            productName,
                            "${s3service.s3baseUrlModel!.results!.url}$slicedImageUrl",
                            category!,
                            selectedSubCategory!,
                            productType!,
                            moq,
                            stockStatus!,
                            selectedStatus == "unlimited" ? "0" : stockQty,
                            longDescription,
                            longDescription,
                            price.toString(),
                            selectedTax.cast<String>(),
                            isTaxIncluded ? "yes" : "no",
                            context);
                        print(selectedTax);
                        setState(() {
                          isLoading = false;
                        });
                        itemNameController.clear();
                        priceController.clear();
                        discountOriceController.clear();
                        shortDescriptionController.clear();
                        longDescriptionController.clear();
                        stockQtyController.clear();
                        moqController.clear();
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        // ignore: use_build_context_synchronously
                        return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Alert'),
                              content: const Text("Something went wrong"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                backgroundColor: orangeColor,
                pressElevation: 4.0,
                padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: Utils().getScreenSize().width * 0.3),
                elevation: 4.0,
                disabledColor: orangeColor,
                label: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Post",
                        style: TextStyle(color: Colors.white),
                      )),
          ),
        ],
      ),
    );
  }

  //------------

  AllCategoryModel? allCategoryModel;
  String accessToken = "";

  List allCategoryList = [];
  Future<List<dynamic>> getAllCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';

    var data = await http.get(
      Uri.parse(Config.baseapiUrl + Config.allCategoryApi),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    //print('${tokenValue.toString()}');
    var jsonData = json.decode(data.body);
    print('working 2');
    print(jsonData);
    allCategoryModel = AllCategoryModel.fromJson(jsonData);

    setState(() {
      for (var item in allCategoryModel!.results!) {
        allCategoryList.add({"name": item.name, "id": item.id});
      }
    });

    print(allCategoryList);
    print('working 3');
    //print(dataUserDetailsModel);
    return allCategoryList;
  }

  // ------SubCategory-----

  AllSubCategoryModel? allSubCategoryModel;
  List allSubCategoryList = [];
  Future<List<dynamic>> getAllSubCategory(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';

    var data = await http.get(
      Uri.parse(Config.baseapiUrl + Config.allSubCategory + id),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    //print('${tokenValue.toString()}');
    var jsonData = json.decode(data.body);

    print('working 2');
    print(jsonData);
    allSubCategoryModel = AllSubCategoryModel.fromJson(jsonData);

    setState(() {
      for (var item in AllSubCategoryModel.fromJson(jsonData).results!) {
        allSubCategoryList.add({"name": item.name, "id": item.id});
      }
    });
    print(allSubCategoryList);
    print('working 3');
    //print(dataUserDetailsModel);
    return allSubCategoryList;
  }

// ----------------
  Future<String?> getS3ImageUrl(File file) async {
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
        accessControl: S3AccessControl.private,
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
