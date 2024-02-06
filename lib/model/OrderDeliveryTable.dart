// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
// import 'package:robisalesautomation/utility/mycolors.dart';
//
// class OrderDeliveryTable extends StatelessWidget {
//   final List<Map<String, dynamic>> tableData;
//
//   OrderDeliveryTable({required this.tableData});
//
//   @override
//   Widget build(BuildContext context) {
//     // Calculate total amount
//     double totalAmount = 100.0;
//     for (var data in tableData) {
//       totalAmount += data['Price'];
//     }
//
//     return DataTable(
//       headingRowColor: MaterialStateProperty.all<Color>(Appcolors.secondary),
//       columnSpacing: 15,
//       columns: const [
//         DataColumn(
//           label: Text('Item', style: TextStyle(color: Colors.white)),
//         ),
//         DataColumn(
//           label: Text('Quantity', style: TextStyle(color: Colors.white)),
//         ),
//         DataColumn(
//           label: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Delivery',
//                   softWrap: true, style: TextStyle(color: Colors.white)),
//               Text('Count',
//                   softWrap: true, style: TextStyle(color: Colors.white)),
//             ],
//           ),
//         ),
//         DataColumn(
//           label: Text('Price',
//               softWrap: true, style: TextStyle(color: Colors.white)),
//         ),
//       ],
//       rows: [
//         ...List<DataRow>.generate(
//           tableData.length,
//           (index) => DataRow(
//             cells: [
//               DataCell(Text(tableData[index]['Item'].toString())),
//               DataCell(Text(tableData[index]['Quantity'].toString())),
//               DataCell(Text(tableData[index]['Delivery Count'].toString())),
//               DataCell(Text(tableData[index]['Price'].toString())),
//             ],
//           ),
//         ),
//         // Additional row for total amount
//         DataRow(cells: [
//           DataCell(Text('Total Amount')),
//
//           DataCell(Text('')), // Empty cell for Quantity
//           DataCell(Text('')), // Empty cell for Delivery Count
//           DataCell(Text(totalAmount.toStringAsFixed(2))),
//         ]),
//       ],
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

class OrderDeliveryTable extends StatelessWidget {
  final List<Map<String, dynamic>> tableData;

  OrderDeliveryTable({required this.tableData});

  @override
  Widget build(BuildContext context) {
    // Calculate total amount
    double totalAmount = 0.0;
    for (var data in tableData) {
      totalAmount += data['Price'];
    }

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all<Color>(Appcolors.secondary),
          columnSpacing: 10,
          columns: const [
            DataColumn(label: Text('SL', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('Item Name', style: TextStyle(color: Colors.white),)),
            DataColumn(label: Text('Rate', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('STK', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('OQ', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('UQ', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('CQ', style: TextStyle(color: Colors.white))),
          ],
          rows: [
            ...List<DataRow>.generate(
              tableData.length,
                  (index) => DataRow(
                cells: [
                  DataCell(Text((index + 1).toString())),
                  DataCell(
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 100), // Adjust the max width as needed
                        child: Text(
                          tableData[index]['Item'].toString(),
                          softWrap: true,
                        ),
                      ),
                    ),),
                  DataCell(Text(tableData[index]['Rate'].toString())),
                  DataCell(Text(tableData[index]['STK'].toString())),
                  DataCell(Text(tableData[index]['OQ'].toString())),
                  DataCell(Text(tableData[index]['UQ'].toString())),
                  DataCell(
                    TextFormField(
                      initialValue: tableData[index]['CQ'].toString(),
                      onChanged: (value) {
                        // Update your data source when input changes
                        // Here you might want to update the 'CQ' value of your tableData
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Additional row for total amount
            // DataRow(cells: [
            //   DataCell(Text('')),
            //   DataCell(Text('')), // Empty cell for Item Name
            //   DataCell(Text('')), // Empty cell for Rate
            //   DataCell(Text('')), // Empty cell for STK
            //   DataCell(Text('')), // Empty cell for OQ
            //   DataCell(Text('Total Amount', style: TextStyle(fontWeight: FontWeight.bold))), // Empty cell for UQ
            //   DataCell(Text(totalAmount.toStringAsFixed(2), style: TextStyle(fontWeight: FontWeight.bold))),
            // ]),
          ],
        ),
      ),
    );
  }
}
