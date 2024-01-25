import 'package:flutter/material.dart';
import 'package:robisalesautomation/model/OrderDeliveryTable.dart';

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
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 248, 56, 88),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 248, 56, 88),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            // color: const Color.fromARGB(255, 248, 56, 88),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            child: Container(
              padding: EdgeInsets.all(8),
              child: OrderDeliveryTable(
                tableData: [
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
    );
  }
}
