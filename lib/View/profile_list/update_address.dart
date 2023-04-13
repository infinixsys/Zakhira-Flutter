import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakira/Models/city_model.dart';
import 'package:zakira/Models/states_model.dart';
import 'package:zakira/Services/address_service.dart';
import 'package:zakira/Services/config.dart';
import 'package:zakira/Services/tax_service.dart';
import 'package:zakira/Utils/Utils.dart';
import 'package:zakira/Utils/colors.dart';
import 'package:http/http.dart' as http;

class UpdateAddressScreen extends StatefulWidget {
  String firstName;
  String lastName;
  String address;
  String state;
  String city;
  String phoneNumber;
  String alternatePhoneNumber;
  String addressId;
  String zipCode;

  UpdateAddressScreen(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.alternatePhoneNumber,
      required this.city,
      required this.phoneNumber,
      required this.state,
      required this.addressId,
      required this.zipCode});

  @override
  State<UpdateAddressScreen> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<UpdateAddressScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController alternatePhoneNumberController =
      TextEditingController();
  Map<String?, dynamic>? stateChosen = null;
  Map<String?, dynamic>? cityChosen = null;
  TaxService taxService = TaxService();

  bool isLoading = false;

  AddressService addressService = AddressService();
  String? selectedName;
  int index = 5;
  String? selectedcityId;
  List<String> stateListItmes = ["64269884480b3381cbc32d0a"];
  List<String> cityListItmes = [
    "6426997254ba1301f994a180",
    "6426995954ba1301f994a17c",
    "6426996954ba1301f994a17e"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // addressService.fetchStateData().then((stateList) {
    //   setState(() {
    //     stateListItmes = stateList!.results!.length as List<String>;
    //     print("The List : $stateListItmes");
    //   });
    // });

    nameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    addressController.text = widget.address;
    zipCodeController.text = widget.zipCode;
    phoneNumberController.text = widget.phoneNumber;
    alternatePhoneNumberController.text = widget.alternatePhoneNumber;
    getAllState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Text("Update Shipping Address",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 20))),
          Container(
            width: Utils().getScreenSize().width * 0.8,
            height: 1.0,
            color: Colors.grey,
          ),
          SizedBox(height: Utils().getScreenSize().height * 0.02),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getAddressField(Utils().getScreenSize().width * 0.45,
                        "First Name", nameController),
                    getAddressField(Utils().getScreenSize().width * 0.45,
                        "Last Name", lastNameController),
                  ],
                ),
                SizedBox(height: Utils().getScreenSize().height * 0.035),
                getAddressField(Utils().getScreenSize().width * 0.9, "Address",
                    addressController),
                SizedBox(height: Utils().getScreenSize().height * 0.035),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18.0),
                  decoration: BoxDecoration(color: searchBarcolor),
                  child: ListTile(
                    title: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                      hint: const Text(
                        "Select State",
                        style: TextStyle(fontSize: 14),
                      ),
                      items: allstateList
                          .map((dynamic item) => DropdownMenuItem(
                              value: item as Map,
                              child: Text(
                                item['name'].toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )))
                          .toList(),
                      value: stateChosen,
                      onChanged: (dynamic value) async {
                        setState(() {
                          selectedName = value['id'].toString();
                          print("click");
                          stateChosen = value!;
                        });
                        if (value != null) {
                          List cityList =
                              await getAllCity(selectedName.toString());
                          setState(() {
                            allCityList = cityList;
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
                allCityList.isEmpty
                    ? SizedBox(height: Utils().getScreenSize().height * 0.035)
                    : Column(
                        children: [
                          SizedBox(
                              height: Utils().getScreenSize().height * 0.035),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            decoration: BoxDecoration(color: searchBarcolor),
                            child: ListTile(
                              title: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                hint: const Text(
                                  "Select City",
                                  style: TextStyle(fontSize: 14),
                                ),
                                items: allCityList
                                    .map((dynamic item) => DropdownMenuItem(
                                        value: item as Map,
                                        child: Text(
                                          item['name'].toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        )))
                                    .toList(),
                                value: cityChosen,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    selectedcityId = value['id'].toString();
                                    cityChosen = value!;
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
                        ],
                      ),
                SizedBox(height: Utils().getScreenSize().height * 0.035),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    controller: zipCodeController,
                    decoration: InputDecoration(
                        labelText: "Zip Code",
                        filled: true,
                        fillColor: searchBarcolor),
                  ),
                ),
                SizedBox(height: Utils().getScreenSize().height * 0.035),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        filled: true,
                        fillColor: searchBarcolor),
                  ),
                ),
                SizedBox(height: Utils().getScreenSize().height * 0.035),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    controller: alternatePhoneNumberController,
                    decoration: InputDecoration(
                        labelText: "Alternate Number",
                        filled: true,
                        fillColor: searchBarcolor),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                )
              ],
            ),
          )),
          InkWell(
              onTap: () {
                try {
                  if (nameController.text.isEmpty ||
                      lastNameController.text.isEmpty ||
                      phoneNumberController.text.isEmpty ||
                      selectedName!.isEmpty ||
                      selectedcityId!.isEmpty ||
                      addressController.text.isEmpty ||
                      zipCodeController.text.isEmpty) {
                    AlertDialog(
                      title: const Text('Alert'),
                      content: const Text("Please Fill All The Fields."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    addressService.updateAddressData(
                        nameController.text,
                        lastNameController.text,
                        addressController.text,
                        selectedcityId!,
                        selectedName!,
                        zipCodeController.text,
                        phoneNumberController.text,
                        alternatePhoneNumberController.text,
                        widget.addressId,
                        index,
                        context);
                    setState(() {
                      isLoading = false;
                    });
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: getCustomizedButton(
                  Utils().getScreenSize().width * 0.7,
                  Utils().getScreenSize().height * 0.06,
                  isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          "Update Now",
                          style: TextStyle(color: Colors.white),
                        ),
                  orangeColor,
                  const Border())),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  getAddressField(
      double width, String Mylabel, TextEditingController controller) {
    return SizedBox(
        width: width,
        height: Utils().getScreenSize().height * 0.075,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              labelText: Mylabel, filled: true, fillColor: searchBarcolor),
        ));
  }

  // -------- get State

  StatesModel? statesNameIdModel;
  String accessToken = "";

  List allstateList = [];
  Future<List<dynamic>> getAllState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';

    var data = await http.get(
      Uri.parse(Config.baseapiUrl + Config.getStatatApi),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    //print('${tokenValue.toString()}');
    var jsonData = json.decode(data.body);
    print('working 2');
    print(jsonData);
    statesNameIdModel = StatesModel.fromJson(jsonData);

    setState(() {
      for (var item in StatesModel.fromJson(jsonData).results!) {
      allstateList.add({"name": item.name, "id": item.id});
    }
    });

    print(allstateList);
    print('working 3');
    //print(dataUserDetailsModel);
    return allstateList;
  }

  // ------ get cities
  CityModel? cityModel;
  List allCityList = [];
  Future<List<dynamic>> getAllCity(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accesstoken') ?? '';

    var data = await http.get(
      Uri.parse(Config.baseapiUrl + Config.getCityApi + id),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    //print('${tokenValue.toString()}');
    var jsonData = json.decode(data.body);

    print('working 2');
    print(jsonData);
    cityModel = CityModel.fromJson(jsonData);

    for (var item in CityModel.fromJson(jsonData).results!) {
      allCityList.add({"name": item.name, "id": item.id});
    }

    print(allCityList);
    print('working 3');
    //print(dataUserDetailsModel);
    return allCityList;
  }
}
