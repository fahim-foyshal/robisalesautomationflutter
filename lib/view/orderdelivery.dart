// import 'package:flutter/material.dart';
//
// import 'package:robisalesautomation/model/OrderDeliveryTable.dart';
//
// import 'package:robisalesautomation/main.dart';
// import 'package:robisalesautomation/utility/mycolors.dart';
//
//
// class Orderdelivery extends StatefulWidget {
//   const Orderdelivery({super.key});
//
//   @override
//   State<Orderdelivery> createState() => _OrderdeliveryState();
// }
//
// class _OrderdeliveryState extends State<Orderdelivery> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Order Delivery",
//           style: TextStyle(color: Colors.white,fontFamily: "monospace",),
//         ),
//
//         backgroundColor: Appcolors.primary,
//
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//
//               height: MediaQuery.of(context).size.height * 0.20,
//               width: MediaQuery.of(context).size.width,
//               margin: const EdgeInsets.all(10),
//               decoration: const BoxDecoration(
//
//
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               // color: const Color.fromARGB(255, 248, 56, 88),
//               child: Card(
//                 color: Appcolors.secondary,
//                 elevation: 20,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   child: const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Center(
//                         child: Text(
//                           "Shop name:M/SF,M Electronics",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontFamily: "monospace",
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Name:Alomgir",
//                               style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "monospace",),
//                             ),
//                             Text(
//                               'Phone Number:01800000000000',
//                               style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "monospace",),
//                             ),
//                             Text(
//                               'Adress: Gulshan',
//                               style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "monospace",),
//                             ),
//                             Text(
//                               'Shop Code :000000.0000000',
//                               softWrap: true,
//                               style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "monospace",),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20.0),
//                     topRight: Radius.circular(20.0),
//                   ),
//                 ),
//                 padding: EdgeInsets.all(8),
//                 child: OrderDeliveryTable(
//                   tableData: const [
//                     {
//                       'Item': 'Fahim',
//                       'Quantity': 2,
//                       'Delivery Count': 4,
//                       'Price': 200
//                     },
//                     {
//                       'Item': 'Ruhul',
//                       'Quantity': 5,
//                       'Delivery Count': 4,
//                       'Price': 40
//                     },
//                     {
//                       'Item': 'Ashraf',
//                       'Quantity': 3,
//                       'Delivery Count': 10,
//                       'Price': 70
//                     },
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(8),
//               height: 100,
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       elevation: 8.0, // Adjust the elevation
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 12.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//
//                       backgroundColor: Colors.blueAccent,
//                     ),
//                     child: const Text(
//                       "Submit Delivery",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   ElevatedButton(
//
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       elevation: 8.0, // Adjust the elevation
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 12.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//
//                       backgroundColor: Colors.red,
//                     ),
//                     child: const Text(
//                       "Discard Delivary",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'package:robisalesautomation/model/OrderDeliveryTable.dart';

import 'package:robisalesautomation/main.dart';
import 'package:robisalesautomation/services/notification_service.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

//
// class Orderdelivery extends StatefulWidget {
//   const Orderdelivery({super.key});
//
//   @override
//   State<Orderdelivery> createState() => _OrderdeliveryState();
// }
//
// class _OrderdeliveryState extends State<Orderdelivery> {
//   late String chalanDate;
//
//   @override
//   void initState() {
//     super.initState();
//     chalanDate = _getCurrentDate();
//   }
//
//   String _getCurrentDate() {
//     DateTime now = DateTime.now();
//     String formattedDate = '${now.day}-${now.month}-${now.year}';
//     return formattedDate;
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Order Delivery",
//           style: TextStyle(color: Colors.white,fontFamily: "monospace",),
//         ),
//
//         backgroundColor: Appcolors.primary,
//
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.20,
//               width: MediaQuery.of(context).size.width,
//               margin: const EdgeInsets.all(10),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               // color: const Color.fromARGB(255, 248, 56, 88),
//               child: Card(
//                 color: Appcolors.secondary,
//                 elevation: 20,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   child: const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Center(
//                         child: Text(
//                           "Shop name:M/SF,M Electronics",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontFamily: "monospace",
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "DO Number: 1766",
//                               style: TextStyle(fontSize: 18, color: Colors.white,fontFamily: "monospace",),
//                             ),
//                             Text(
//                               'Date:05-02-2024',
//                               style: TextStyle(fontSize: 18, color: Colors.white,fontFamily: "monospace",),
//                             ),
//                             Text(
//                               'Chalan Date: $chalanDate',
//                               style: TextStyle(fontSize: 18, color: Colors.white,fontFamily: "monospace",),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//               ),
//               padding: EdgeInsets.all(8),
//               child: OrderDeliveryTable(
//                 tableData: [
//                   {
//                     'Item': 'Fahim',
//                     'Rate': 2,
//                     'STK': 4,
//                     'OQ': 200,
//                     'UQ': 2,
//                     'Price': 200
//                   },
//                   {
//                     'Item': 'Ruhul',
//                     'Rate': 5,
//                     'STK': 4,
//                     'OQ': 40,
//                     'UQ': 1,
//                     'Price': 40
//                   },
//                   {
//                     'Item': 'Ashraf',
//                     'Rate': 3,
//                     'STK': 10,
//                     'OQ': 70,
//                     'UQ': 3,
//                     'Price': 70
//                   },
//                 ],
//               )
//
//             ),
//             Container(
//               padding: const EdgeInsets.all(8),
//               height: 100,
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//
//
//
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Submit Delivery"),
//                           backgroundColor: Appcolors.primary,
//                           duration: Duration(seconds: 2),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       elevation: 8.0, // Adjust the elevation
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 12.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//
//                       backgroundColor: Colors.blueAccent,
//                     ),
//                     child: const Text(
//                       "Submit Delivery",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   ElevatedButton(
//
//                     onPressed: () {
//
//
//
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Discard Delivary"),
//                           backgroundColor: Appcolors.primary,
//                           duration: Duration(seconds: 2),
//                         ),
//                       );
//
//                     },
//                     style: ElevatedButton.styleFrom(
//                       elevation: 8.0, // Adjust the elevation
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 12.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//
//                       backgroundColor: Colors.red,
//                     ),
//                     child: const Text(
//                       "Discard Delivary",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Orderdelivery extends StatefulWidget {
  const Orderdelivery({Key? key});

  @override
  State<Orderdelivery> createState() => _OrderdeliveryState();
}

class _OrderdeliveryState extends State<Orderdelivery> {
  late String chalanDate;

  @override
  void initState() {
    super.initState();
    chalanDate = _getCurrentDate();
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';
    return formattedDate;
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
                          "Shop name:M/SF,M Electronics",
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
                              "DO Number: 1766",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: "monospace",
                              ),
                            ),
                            Text(
                              'Date:05-02-2024',
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
              child: OrderDeliveryTable(
                tableData: [
                  {
                    'Item': 'Fahgggggggggggggggggggggggggggggggggggggggggggim',
                    'Rate': 2,
                    'STK': 4,
                    'OQ': 200,
                    'UQ': 2,
                    'Price': 200
                  },
                  {
                    'Item': 'Ruhul',
                    'Rate': 5,
                    'STK': 4,
                    'OQ': 40,
                    'UQ': 1,
                    'Price': 40
                  },
                  {
                    'Item': 'Ashraf',
                    'Rate': 3,
                    'STK': 10,
                    'OQ': 70,
                    'UQ': 3,
                    'Price': 70
                  },
                  {
                    'Item': 'Fahgggggggggggggggggggggggggggggggggggggggggggim',
                    'Rate': 2,
                    'STK': 4,
                    'OQ': 200,
                    'UQ': 2,
                    'Price': 200
                  },
                  {
                    'Item': 'Fahgggggggggggggggggggggggggggggggggggggggggggim',
                    'Rate': 2,
                    'STK': 4,
                    'OQ': 200,
                    'UQ': 2,
                    'Price': 200
                  },
                  {
                    'Item': 'Fahgggggggggggggggggggggggggggggggggggggggggggim',
                    'Rate': 2,
                    'STK': 4,
                    'OQ': 200,
                    'UQ': 2,
                    'Price': 200
                  },
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Submit Delivery"),
                          backgroundColor: Appcolors.primary,
                          duration: Duration(seconds: 2),
                        ),
                      );
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
                  ElevatedButton(
                    onPressed: () async{
                        await NotificationService.showNotification(
                          title: "Title of the notification",
                          body: "Body of the notification",
                        );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Discard Delivery"),
                          backgroundColor: Appcolors.primary,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Discard Delivery",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],





              ),
            ),
          ],
        ),
      ),
    );
  }
}
