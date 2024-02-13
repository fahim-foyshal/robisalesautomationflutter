import 'package:flutter/material.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

class DeliveredOrderReportTable extends StatelessWidget {
  final List<Map<String, dynamic>> tableData;
  final Function(int index, Map<String, dynamic> newData) onUpdate;

  DeliveredOrderReportTable({required this.tableData, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      padding: EdgeInsets.all(6),
      child: DataTable(
        headingRowColor: MaterialStateProperty.all<Color>(Appcolors.secondary),
        columnSpacing: 10,
        dataRowMaxHeight: double.infinity,
        columns: const [
          DataColumn(label: Text('SL', style: TextStyle(color: Colors.white))),
          DataColumn(
              label: Text(
            'Item',
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text('Rate', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('STK', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('OQ', style: TextStyle(color: Colors.white))),
          // DataColumn(label: Text('UQ', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('CQ', style: TextStyle(color: Colors.white))),
        ],
        rows: List<DataRow>.generate(
          tableData.length,
          (index) => DataRow(
            cells: [
              DataCell(Text((index + 1).toString())),
              DataCell(
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  constraints: BoxConstraints(maxWidth: 110),
                  child: Text(
                    tableData[index]['item_name'].toString(),
                    softWrap: true,
                  ),
                ),
              ),
              DataCell(Text(tableData[index]['rate'].toString())),
              DataCell(Text(tableData[index]['stock'].toString())),
              DataCell(Text(tableData[index]['orderquantity'].toString())),
              DataCell(Text(tableData[index]['CQ'].toString())),
              // DataCell(Text(tableData[index]['UQ'].toString())),
              // DataCell(
              //   TextFormField(
              //     initialValue: tableData[index]['CQ'].toString(),
              //     onChanged: (value) {
              //       onUpdate(index, {
              //         ...tableData[index],
              //         'CQ': int.parse(value),
              //       });
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
