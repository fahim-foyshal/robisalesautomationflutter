import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:robisalesautomation/model/DistributorData.dart';
import 'package:robisalesautomation/model/User.dart';
import 'package:robisalesautomation/sqldatabasees/UserDatabase.dart';
import 'package:robisalesautomation/utility/mycolors.dart';
import 'package:robisalesautomation/view/DeliveredOrderReport.dart';
import 'package:robisalesautomation/view/GetOrder.dart';
import 'package:robisalesautomation/view/orderdelivery.dart';

class PendingDoList extends StatefulWidget {
  const PendingDoList({Key? key}) : super(key: key);

  @override
  State<PendingDoList> createState() => _PendingDoListState();
}

class _PendingDoListState extends State<PendingDoList> {
  List<Map<String, dynamic>> doitems = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    UserDatabase userDatabase = UserDatabase();
    User? user = await userDatabase.getUser();
    final apiUrl =
        'https://starlineerp.com/CloudERP/sec_mod/api/api_search_doByStatus.php';
    final dio = Dio();
    final dealerCode = user?.dealerCode;
    final jsonData = [
      {"dealercode": dealerCode, "do_status": "MANUAL"}
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
        List<Map<String, dynamic>> jsonList =
            (json.decode(response.data) as List<dynamic>)
                .cast<Map<String, dynamic>>();
        setState(() {
          doitems = jsonList;
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  String _addLeadingZero(int value) {
    return value < 10 ? '0$value' : '$value';
  }

  String _getCurrentDateAndTime() {
    DateTime now = DateTime.now();
    String formattedDate =
        '${now.day}-${_addLeadingZero(now.month)}-${now.year}';
    String formattedTime =
        '${_get12HourFormat(now.hour)}:${_addLeadingZero(now.minute)}:${_addLeadingZero(now.second)} ${_getAMPM(now.hour)}';
    return '$formattedDate';
  }

  String _get12HourFormat(int hour) {
    int hour12 = hour > 12 ? hour - 12 : hour;
    return _addLeadingZero(hour12);
  }

  String _getAMPM(int hour) {
    return hour >= 12 ? 'PM' : 'AM';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delivered List',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "monospace",
          ),
        ),
        backgroundColor: Appcolors.primary,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: doitems.length,
          itemBuilder: (BuildContext context, int index) {
            String currentDateAndTime = _getCurrentDateAndTime();
            return InkWell(
              onTap: () {
                // add onTap code
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetOrder(
                      doNo: doitems[index]['do_no'],
                      shopName: doitems[index]['shop_name'],
                      doDate: doitems[index]['do_date'],
                      delaerCode: doitems[index]['dealer_depot_id'],
                      shopId: doitems[index]['dealer_code'],
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Appcolors.secondary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DO No: ${doitems[index]['do_no']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Shop Name: ${doitems[index]['shop_name']}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Order Date: ${doitems[index]['do_date']}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Text(
                      //       "Order",
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white),
                      //     ),
                      //     Text("0.00"),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
