import 'package:flutter/material.dart';

import 'package:robisalesautomation/model/OrderDeliveryTable.dart';

import 'package:robisalesautomation/main.dart';
import 'package:robisalesautomation/utility/mycolors.dart';


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
        title: const Text(
          "Order Delivery",
          style: TextStyle(color: Colors.white,fontFamily: "monospace",),
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
              // color: const Color.fromARGB(255, 248, 56, 88),
              child: Card(
                color: Appcolors.secondary,
                elevation: 20,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Column(
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
                              "Name:Alomgir",
                              style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "monospace",),
                            ),
                            Text(
                              'Phone Number:01800000000000',
                              style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "monospace",),
                            ),
                            Text(
                              'Adress: Gulshan',
                              style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "monospace",),
                            ),
                            Text(
                              'Shop Code :000000.0000000',
                              softWrap: true,
                              style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "monospace",),
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
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: OrderDeliveryTable(
                  tableData: const [
                    {
                      'Item': 'Fahim',
                      'Quantity': 2,
                      'Delivery Count': 4,
                      'Price': 200
                    },
                    {
                      'Item': 'Ruhul',
                      'Quantity': 5,
                      'Delivery Count': 4,
                      'Price': 40
                    },
                    {
                      'Item': 'Ashraf',
                      'Quantity': 3,
                      'Delivery Count': 10,
                      'Price': 70
                    },
                  ],
                ),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0, // Adjust the elevation
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
        
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0, // Adjust the elevation
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
        
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "Discard Delivary",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
