import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

class OrderDeliveryTable extends StatelessWidget {
  final List<Map<String, dynamic>> tableData;

  OrderDeliveryTable({required this.tableData});

  @override
  Widget build(BuildContext context) {
    // Calculate total amount
    double totalAmount = 100.0;
    for (var data in tableData) {
      totalAmount += data['Price'];
    }

    return DataTable(
      headingRowColor: MaterialStateProperty.all<Color>(Appcolors.secondary),
      columnSpacing: 15,
      columns: const [
        DataColumn(
          label: Text('Item', style: TextStyle(color: Colors.white)),
        ),
        DataColumn(
          label: Text('Quantity', style: TextStyle(color: Colors.white)),
        ),
        DataColumn(
          label: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Delivery',
                  softWrap: true, style: TextStyle(color: Colors.white)),
              Text('Count',
                  softWrap: true, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        DataColumn(
          label: Text('Price',
              softWrap: true, style: TextStyle(color: Colors.white)),
        ),
      ],
      rows: [
        ...List<DataRow>.generate(
          tableData.length,
          (index) => DataRow(
            cells: [
              DataCell(Text(tableData[index]['Item'].toString())),
              DataCell(Text(tableData[index]['Quantity'].toString())),
              DataCell(Text(tableData[index]['Delivery Count'].toString())),
              DataCell(Text(tableData[index]['Price'].toString())),
            ],
          ),
        ),
        // Additional row for total amount
        DataRow(cells: [
          DataCell(Text('Total Amount')),

          DataCell(Text('')), // Empty cell for Quantity
          DataCell(Text('')), // Empty cell for Delivery Count
          DataCell(Text(totalAmount.toStringAsFixed(2))),
        ]),
      ],
    );
  }
}
