import 'package:flutter/material.dart';
import 'package:robisalesautomation/main.dart';

class Orderdelivery extends StatefulWidget {
  const Orderdelivery({super.key});

  @override
  State<Orderdelivery> createState() => _OrderdeliveryState();
}

class _OrderdeliveryState extends State<Orderdelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Delivery",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Appcolors.primary,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Appcolors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            // color: const Color.fromARGB(255, 248, 56, 88),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Shop name:M/SF,M Electronics",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Name:Alomgir",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  Text(
                    'Phone Number:01800000000000',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  Text(
                    'Adress: Gulshan',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  Text(
                    'Shop Code :000000.0000000',
                    softWrap: true,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //     child: ListView(
          //   children: <Widget>[
          //     Center(
          //       child: Text(
          //         'People-Chart',
          //         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     DataTable(
          //       columns: [
          //         DataColumn(
          //           label: Text('ID',
          //               style: TextStyle(
          //                   fontSize: 18, fontWeight: FontWeight.bold)),
          //         ),
          //         DataColumn(
          //           label: Text('Name',
          //               style: TextStyle(
          //                   fontSize: 18, fontWeight: FontWeight.bold)),
          //         ),
          //         DataColumn(
          //           label: Text('Profession',
          //               style: TextStyle(
          //                   fontSize: 18, fontWeight: FontWeight.bold)),
          //         ),
          //       ],
          //       rows: [
          //         DataRow(cells: [
          //           DataCell(Text('1')),
          //           DataCell(Text('Stephen')),
          //           DataCell(Text('Actor')),
          //         ]),
          //         DataRow(
          //           cells: [
          //             DataCell(Text('5')),
          //             DataCell(Text('John')),
          //             DataCell(Text('Student')),
          //           ],
          //         ),
          //         DataRow(
          //           cells: [
          //             DataCell(Text('10')),
          //             DataCell(Text('Harry')),
          //             DataCell(Text('Leader')),
          //           ],
          //         ),
          //         DataRow(
          //           cells: [
          //             DataCell(Text('15')),
          //             DataCell(Text('Peter')),
          //             DataCell(Text('Scientist')),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ],
          // )),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0, // Adjust the elevation
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),

                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text(
                    "Submit Delivery",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0, // Adjust the elevation
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),

                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    "Discard Delivary",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
