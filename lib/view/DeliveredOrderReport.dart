import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher.dart';

import 'package:robisalesautomation/model/DeliveredOrderReportTable.dart';
import 'package:robisalesautomation/main.dart';
import 'package:robisalesautomation/model/User.dart';
import 'package:robisalesautomation/sqldatabasees/UserDatabase.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

class DeliveredOrderReport extends StatefulWidget {
  final String doNo;
  final String shopName;
  final String delaerCode;
  final String doDate;

  const DeliveredOrderReport({
    Key? key,
    required this.doNo,
    required this.shopName,
    required this.delaerCode,
    required this.doDate,
  });

  @override
  State<DeliveredOrderReport> createState() => _DeliveredOrderReportState();
}

class _DeliveredOrderReportState extends State<DeliveredOrderReport> {
  late String chalanDate;
  List<Map<String, dynamic>> tableData = [];

  @override
  void initState() {
    super.initState();
    chalanDate = _getCurrentDate();
    fetchData();
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';
    return formattedDate;
  }

  void updateTableData(int index, Map<String, dynamic> newData) {
    setState(() {
      tableData[index] = newData;
    });
  }

  void fetchData() async {
    UserDatabase userDatabase = UserDatabase();
    User? user = await userDatabase.getUser();
    final apiUrl =
        'https://starlineerp.com/CloudERP/sec_mod/api/api_chalan_details.php';
    final dio = Dio();
    final dealerCode = user?.dealerCode;
    final jsonData = [
      {"dealer_code": dealerCode, "do_no": widget.doNo}
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
          tableData = jsonList;
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void submitDelivery() async {
    // Prepare your data to send to the API
    // For example, convert tableData to JSON
    UserDatabase userDatabase = UserDatabase();
    User? user = await userDatabase.getUser();
    final apiUrl =
        'https://starlineerp.com/CloudERP/sec_mod/api/api_do_chalan.php';
    final dio = Dio();
    final dealerCode = user?.dealerCode;
    String jsonData = json.encode(tableData);

    try {
      // Make the HTTP POST request to the API endpoint
      final response = await dio.post(
        apiUrl,
        data: jsonData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        // Handle successful submission
        print(response.data);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text("Delivery submitted successfully"),
        //     backgroundColor: Appcolors.primary,
        //     duration: Duration(seconds: 2),
        //   ),
        // );
        generatePDF(context); // Call the function to generate the PDF
      } else {
        // Handle unsuccessful submission
        print('Failed to submit delivery. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors
      print('Error submitting delivery: $error');
    }
  }

  Future<void> generatePDF(BuildContext context) async {
    // Create a PDF document
    final pdf = pw.Document();

    // Add content to the PDF document
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('This is a PDF generated from Flutter'),
          );
        },
      ),
    );

    // Save the PDF document to a file
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/example.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());

    // Print the path of the generated PDF file
    print('PDF saved to: $path');

    // Launch the default PDF viewer to open the PDF file
    await launch(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Delivery",
          style: TextStyle(color: Colors.white, fontFamily: "monospace"),
        ),
        backgroundColor: Appcolors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Card(
                color: Appcolors.secondary,
                elevation: 20,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Shop name: ${widget.shopName}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "monospace",
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DO Number: ${widget.doNo}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: "monospace",
                              ),
                            ),
                            Text(
                              'Date: ${widget.doDate}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: "monospace",
                              ),
                            ),
                            Text(
                              'Chalan Date: $chalanDate',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: "monospace",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                padding: EdgeInsets.all(6),
                child: DeliveredOrderReportTable(
                    tableData: tableData, onUpdate: updateTableData)),
            Container(
              padding: const EdgeInsets.all(8),
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      submitDelivery();
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("Submit Delivery"),
                      //     backgroundColor: Appcolors.primary,
                      //     duration: Duration(seconds: 2),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      "Submit Delivery",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text("Discard Delivery"),
                  //         backgroundColor: Appcolors.primary,
                  //         duration: Duration(seconds: 2),
                  //       ),
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     elevation: 8.0,
                  //     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //     ),
                  //     backgroundColor: Colors.red,
                  //   ),
                  //   child: const Text(
                  //     "Discard Delivery",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
