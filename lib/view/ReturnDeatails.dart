// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:robisalesautomation/model/ItemInfo.dart';

import 'package:dio/dio.dart';
import 'package:robisalesautomation/model/User.dart';
import 'package:robisalesautomation/sqldatabasees/UserDatabase.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

class ReturnDeatails extends StatefulWidget {
  final int orNo;
  final String shopName;
  final String delaerCode;
  final String shopId;
  final String? orDate;
  // final String? previousentitems;

  const ReturnDeatails({
    Key? key,
    required this.orNo,
    required this.shopName,
    required this.delaerCode,
    required this.shopId,
    this.orDate,
    // this.previousentitems
  }) : super(key: key);

  @override
  State<ReturnDeatails> createState() => _ReturnDeatailsState();
}

class _ReturnDeatailsState extends State<ReturnDeatails> {
  User? currentUser;
  List<ItemInfo> itemslistall = [];
  List<ItemInfo> sentItems = []; // List to store sent items
  bool isLoading = true;
  double selecteQuantity = 1;
  double totalAmount = 0;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void UpdateDoStatus() async {
    final apiUrl =
        'https://starlineerp.com/CloudERP/sec_mod/api/api_SalesReturn_statusUpdate.php';
    final dio = Dio();
    final data = [
      {
        'or_no': widget.orNo,
        'or_status': "CHECKED",
      }
    ];

    try {
      final response = await dio.post(
        apiUrl,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
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
        'https://starlineerp.com/CloudERP/sec_mod/api/api_itemInfo_List.php';
    final dio = Dio();
    final dealerCode = user?.dealerCode;
    final jsonData = [
      {"dealer_code": dealerCode}
    ];

    try {
      final response = await dio.post(
        apiUrl,
        data: jsonData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
        List<Map<String, dynamic>> jsonList =
            (json.decode(response.data) as List<dynamic>)
                .cast<Map<String, dynamic>>();
        setState(() {
          itemslistall = jsonList
              .asMap()
              .map((index, data) {
                ItemInfo itemInfo = ItemInfo.fromJson(data);
                return MapEntry(
                  index,
                  itemInfo,
                );
              })
              .values
              .toList();
          isLoading = false;
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void sendApiRequest() async {
    final apiUrl =
        'https://starlineerp.com/CloudERP/sec_mod/api/api_sales_return.php';
    final currentDateISOString = DateTime.now().toIso8601String();
    final dealerCode = currentUser?.dealerCode ?? '';
    final currentusercode = currentUser?.user ?? '';
    final dio = Dio();

    // Prepare data to send in the request
    final data = [
      {
        'or_no': widget.orNo,
        'vendor_id': widget.shopId,
        'vendor_name': widget.shopName,
        'or_date': widget.orDate,
        "receive_type": "Sales Return",
        'item_id': selectedItemDetails?.itemId,
        'warehouse_id': widget.delaerCode,
        'rate': selectedItemDetails?.tPrice,
        'disc': selectedItemDetails?.nspPer,
        'unit_name': selectedItemDetails?.unitName,
        'qty': selecteQuantity,
        'amount': totalAmount,
        'entry_by': currentusercode,
      }
    ];
    print(data);
    try {
      final response = await dio.post(
        apiUrl,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        // Handle success response
        print(response.data);
        // Add sent item to the list
        if (selectedItemDetails != null) {
          // Set the totalAmount using the setter
          ItemInfo newItem = ItemInfo(
            itemName: selectedItemDetails!.itemName,
            itemId: selectedItemDetails!.itemId,
            tPrice: selectedItemDetails!.tPrice,
            nspPer: selectedItemDetails!.nspPer,
            packSize: selectedItemDetails!.packSize,
          );
          // Set the totalAmount using the setter
          newItem.setTotalAmount(totalAmount.toString());
          newItem.setTotalQuantity(selecteQuantity.toString());
          sentItems.add(newItem);
        }
        setState(() {
          // Clear fields after sending request
          selecteQuantity = 1;
          totalAmount = 0;
          selectedItemDetails = null;
        });
      } else {
        print(
            'Failed to send API request. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error sending API request: $error');
    }
  }

  String? selectedItem;
  ItemInfo? selectedItemDetails;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _showQuantityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Quantity'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter quantity',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      selecteQuantity = double.tryParse(value) ?? 1;
                      if (selectedItemDetails != null &&
                          selectedItemDetails!.tPrice != null) {
                        totalAmount = selecteQuantity *
                            double.parse(selectedItemDetails!.tPrice!);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                sendApiRequest();
                Navigator.of(context).pop();
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth = screenWidth * 0.9;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Return',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "monospace",
          ),
        ),
        backgroundColor: Appcolors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                padding: EdgeInsets.all(0),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.shopName}',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Appcolors.primary),
                    ),
                    Text(
                      'OR NO: ${widget.orNo}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.purpleAccent),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 20,
              color: Appcolors.lightwhite,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<ItemInfo>(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: itemslistall
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item.itemName as String,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedItemDetails,
                  onChanged: (value) {
                    setState(() {
                      selectedItemDetails = value;
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
                      return item.value!.itemName
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
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 20,
                color: Appcolors.lightwhite,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: targetWidth,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Per Unit Price',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.deepPurple),
                          ),
                          Text('${selectedItemDetails?.tPrice ?? " "}'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Unit Name',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.deepPurple),
                          ),
                          Text('${selectedItemDetails?.unitName ?? " "}'),
                        ],
                      ),
                      // Column(
                      //   children: [
                      //     Text(
                      //       'Stock',
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.w800,
                      //           color: Colors.deepPurple),
                      //     ),
                      //     Text('${selectedItemDetails?.itemStock ?? " "}'),
                      //   ],
                      // ),
                      Visibility(
                        // visible: double.tryParse(
                        //         selectedItemDetails?.itemStock ?? "0") !=
                        //     0, // Show the button if itemStock is 0
                        visible: true,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                              if (isExpanded) {
                                _showQuantityDialog();
                              }
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Display cards for sent items
            ...sentItems.map((item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${item.itemName}"),
                              Text("Quantity: ${item.totalQuantity}")
                            ],
                          ),
                          Text("Total : ${item.totalAmount}")
                        ],
                      ),
                    ),
                  ),
                )),

            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: targetWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        'Total Amounts: ${sentItems.fold(0.0, (prev, item) => prev + double.parse(item.totalAmount ?? '0')).toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement your logic for the first button
              },
              child: Text('Home'),
            ),
            ElevatedButton(
              onPressed: () {
                UpdateDoStatus();
                // Implement your logic for the second button
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
