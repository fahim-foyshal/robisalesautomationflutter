import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:robisalesautomation/model/ItemInfo.dart';

import 'package:dio/dio.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

class GetOrder extends StatefulWidget {
  final int doNo;
  final String shopName;
  final String delaerCode;

  const GetOrder({
    Key? key,
    required this.doNo,
    required this.shopName,
    required this.delaerCode,
  }) : super(key: key);

  @override
  State<GetOrder> createState() => _GetOrderState();
}

class _GetOrderState extends State<GetOrder> {
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

  void fetchData() async {
    final apiUrl = 'https://ezzy-erp.com/newapp/api/api_itemInfo_List.php';
    final dio = Dio();

    try {
      final response = await dio.post(
        apiUrl,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
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
    final apiUrl = 'https://ezzy-erp.com/newapp/api/api_doDetails.php';
    final currentDateISOString = DateTime.now().toIso8601String();
    final dio = Dio();

    // Prepare data to send in the request
    final data = [
      {
        'do_no': widget.doNo,
        'do_date': currentDateISOString,
        'item_id': selectedItemDetails?.itemId,
        'dealer_code': widget.delaerCode,
        't_price': selectedItemDetails?.tPrice,
        'nsp_per': selectedItemDetails?.nspPer,
        'pack_size': selectedItemDetails?.packSize,
        'unit_price': selectedItemDetails?.tPrice,
        'total_unit': selecteQuantity,
        'total_amt': totalAmount,
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
        // Handle success response
        print(response.data);
        // Add sent item to the list
        if (selectedItemDetails != null) {
          // Set the totalAmount using the setter
          selectedItemDetails?.setTotalAmount(totalAmount.toString());
          sentItems.add(selectedItemDetails!);
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
          'Add Order',
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
                      'DO NO: ${widget.doNo}',
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
                    'Select Shop',
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
                      IconButton(
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
                    child: ListTile(
                      title: Text(item.itemName ?? ''),
                      subtitle: Text('Total Amount: ${item.totalAmount ?? ''}'),
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
    );
  }
}
