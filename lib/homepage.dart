import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xFF0284C7),
        toolbarHeight: 10,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFF0284C7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  // You can replace the Image.network with your actual image loading logic
                  child: Image.network(
                    'https://example.com/your_image_path.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'kamal hossain',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "monospace",
                      ),
                    ),
                    Text(
                      'sales manager',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "DMMono-Regular",
                      ),
                    ),
                    Text(
                      'ID :00155',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "DMMono-Regular",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: [
              buildCard(
                icon: Icons.shop_outlined,
                color: Colors.purple,
                text: 'Distributer',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: Icons.shop_outlined,
                color: Color(0xFFD9EDBF),
                text: 'Orders Amount',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: Icons.shop_outlined,
                color: Color(0xFFFFB996),
                text: 'Product',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              // Add more cards as needed
              // ...
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required IconData icon,
    required Color color,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 3 - 15 * 2,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: color,
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
