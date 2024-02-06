import 'package:flutter/material.dart';
import 'package:robisalesautomation/model/DistributorData.dart';
import 'package:robisalesautomation/utility/mycolors.dart';
import 'package:robisalesautomation/view/orderdelivery.dart';

class Orderlist extends StatefulWidget {
  const Orderlist({Key? key}) : super(key: key);

  @override
  State<Orderlist> createState() => _OrderlistState();
}
class _OrderlistState extends State<Orderlist> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  final List<String> shopnames = [
    'Shop 1',
    'Shop 2',
    'Shop 3',
    'Shop 4',
  ];

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
          'Order List',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "monospace",
          ),
        ),
        backgroundColor: Appcolors.primary,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            String currentDateAndTime = _getCurrentDateAndTime();
            return InkWell(
              onTap: () {
                // add onTap code
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Orderdelivery(
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
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order No: ${items[index]}",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                            Text("Shop Name: ${shopnames[index]}",style: TextStyle(color: Colors.white),),
                            Text("Order Date: $currentDateAndTime",style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Order",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          Text("0.00"),
                        ],
                      ),
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
