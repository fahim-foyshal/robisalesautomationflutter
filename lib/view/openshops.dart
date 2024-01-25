// Import the necessary libraries
import 'package:flutter/material.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

// Create a new StatefulWidget class
class AddShopPage extends StatefulWidget {
  @override
  _AddShopPageState createState() => _AddShopPageState();
}

// Create a corresponding State class
class _AddShopPageState extends State<AddShopPage> {
  // Define variables to store the entered shop details
  String _shopName = '';
  String _shopAddress = '';

  // Define methods to handle user input
  void onShopNameChanged(String value) {
    setState(() {
      _shopName = value;
    });
  }

  void onShopAddressChanged(String value) {
    setState(() {
      _shopAddress = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Shop',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "monospace",
          ),
        ),
        backgroundColor: Appcolors.primary,
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Add image picker widget here
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Implement image picking logic here
                },
                child: const Text('Add Image',style: TextStyle(fontFamily: "monospace",),),
              ),
            ),
            const SizedBox(height: 15.0),
            Card(
              color: Colors.white,
              elevation: 20,
              child: TextField(
                decoration:
                const InputDecoration(
                  labelText: 'Enter Shop Name',
                ),
                onChanged: onShopNameChanged,
              ),
            ),
            const SizedBox(height: 15.0),
            Card(
              color: Colors.white,
              elevation: 20,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter Shop Address',
                ),
                onChanged: onShopAddressChanged,
              ),
            ),
            const SizedBox(height: 15.0),
             Container(
               height: 80,
               width: MediaQuery.of(context).size.width,
               child: Card(
                color: Colors.white,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Text("LATITUDE:23.8405309"),
                      SizedBox(height: 10.0),
                      Text("Longitude:90.084")
                    ],
                  ),
                ),
                           ),
             ),
            const SizedBox(height: 15.0),
            Container(

            ),
            // Implement dropdown menus for zone, division, and territory here
          ],
        ),
      ),
    );
  }
}
