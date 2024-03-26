import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:robisalesautomation/model/Shop.dart';
import 'package:robisalesautomation/utility/mycolors.dart';
import 'package:robisalesautomation/model/User.dart';
import 'package:robisalesautomation/sqldatabasees/UserDatabase.dart';
import 'package:robisalesautomation/view/GetOrder.dart';
import 'package:robisalesautomation/view/ReturnDeatails.dart';

class InitiateReturn extends StatefulWidget {
  @override
  _InitiateReturnState createState() => _InitiateReturnState();
}

class _InitiateReturnState extends State<InitiateReturn> {
  List<Shop> items = [];
  List<String> status_list = ['No Order', "Return", "Close"];
  User? currentUser;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    UserDatabase userDatabase = UserDatabase();
    User? user = await userDatabase.getUser();
    if (user != null) {
      setState(() {
        currentUser = user;
      });
    }
    final apiUrl =
        'https://starlineerp.com/CloudERP/sec_mod/api/api_findShopByDealer.php';
    final dealerCode = user?.dealerCode;
    final jsonData = [
      {"dealer_code": dealerCode}
    ];

    final dio = Dio();

    try {
      final response = await dio.post(
        apiUrl,
        data: jsonData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> jsonList =
            (json.decode(response.data) as List<dynamic>)
                .cast<Map<String, dynamic>>();

        List<Shop> decodedShops =
            (jsonList as List).map((data) => Shop.fromJson(data)).toList();

        setState(() {
          items = decodedShops;
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void submitOrder() async {
    if (selectedshopdetails == null ||
        selectedStatus == null ||
        remarks == null) {
      // Display an error message or handle validation
      return;
    }

    final apiUrl =
        'https://starlineerp.com/CloudERP/sec_mod/api/api_ss_receive_master.php';
    final currentDateISOString = DateTime.now().toIso8601String();
    final dealerCode = currentUser?.dealerCode ?? '';
    final currentusercode = currentUser?.user ?? '';

    final String shopId = selectedshopdetails?.dealerCode ?? '';
    final String selectedShopname = selectedshopdetails?.shopName ?? '';

    final arrayitem = [
      {
        'return_Date': currentDateISOString,
        'vendor_id': shopId,
        'vendor_name': selectedShopname,
        'status': 'MANUAL',
        'remarks': remarks,
        'visit': '1',
        'memo': '1',
        'longitude': '',
        'latitude': '',
        'entry_by': currentusercode,
        'dealer_depot_id': dealerCode,
        'upload_status': 1,
        'receive_type': 'Sales Return'
      }
    ];
    print(arrayitem);
    final dio = Dio();

    try {
      final response = await dio.post(
        apiUrl,
        data: arrayitem,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        // Handle success, maybe show a success message
        print(response.data);

        Map<String, dynamic> responseData = json.decode(response.data);

        if (responseData['message'] == 'Done' && selectedStatus == "Return") {
          final int orNo = responseData['or_no'] ?? '';
          final String shopName = selectedShop ?? " ";
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReturnDeatails(
                  orNo: orNo,
                  shopName: selectedShopname,
                  orDate: currentDateISOString,
                  delaerCode: dealerCode,
                  shopId: shopId),
            ),
          );
        }
      } else {
        // Handle failure, maybe show an error message
        print('Failed to submit order. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error, maybe show an error message
      print('Error: $error');
    }
  }

  DateTime currentDate = DateTime.now();

  TextEditingController remarksController = TextEditingController();

  String? selectedShop;
  String? selectedStatus;
  String? remarks;
  Shop? selectedshopdetails;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth = screenWidth * 0.9;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Initiate Return',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "monospace",
          ),
        ),
        backgroundColor: Appcolors.primary,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            Card(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<Shop>(
                  isExpanded: true,
                  hint: Text(
                    'Select Shop',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item.shopName as String,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedshopdetails,
                  onChanged: (value) {
                    setState(() {
                      selectedshopdetails = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 60,
                    width: targetWidth,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    maxHeight: 200,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.all(8),
                    height: 50,
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: textEditingController,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        controller: textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Search for a shop...',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return item.value
                          .toString()
                          .toLowerCase()
                          .contains(searchValue.toLowerCase());
                    },
                  ),
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      textEditingController.clear();
                    }
                  },
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: targetWidth,
                  height: 60,
                  child: Text(
                    '${DateFormat('dd-MM-yyyy').format(currentDate)}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Status',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: status_list
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedStatus,
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 60,
                    width: targetWidth,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    maxHeight: 200,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.all(8),
                    height: 50,
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: textEditingController,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        controller: textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Search for a shop...',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return item.value
                          .toString()
                          .toLowerCase()
                          .contains(searchValue.toLowerCase());
                    },
                  ),
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      textEditingController.clear();
                    }
                  },
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  width: targetWidth,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Remarks',
                    ),
                    onChanged: (value) {
                      setState(() {
                        remarks = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                submitOrder();
                //Snackbar
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text("Discard"),
                //     backgroundColor: Appcolors.primary,
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                // Adjust the elevation
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
