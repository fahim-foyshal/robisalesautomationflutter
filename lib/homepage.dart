import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robisalesautomation/distributer.dart';

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
        backgroundColor: const Color.fromARGB(255, 248, 56, 88),
        toolbarHeight: 10,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 248, 56, 88),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.all(10),
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
                    'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
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
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: [
              buildCard(
                icon: FontAwesomeIcons.building,
                color: Colors.purple,
                text: 'Distributer',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DistributerList()),
                  );
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.shop,
                color: const Color(0xFFD9EDBF),
                text: 'Orders Amount',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.boxOpen,
                color: const Color(0xFFFFB996),
                text: 'Product',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.floppyDisk,
                color: const Color(0xFFFFCF81),
                text: 'Saved Info',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.fileClipboard,
                color: const Color(0xFFB3A492),
                text: 'Pending',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.clipboardCheck,
                color: const Color(0xFF4F6F52),
                text: 'Report',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.bullseye,
                color: const Color(0xFF6B240C),
                text: 'target',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.info,
                color: const Color(0xFFFF4A4F),
                text: 'KPI',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.mapLocation,
                color: Colors.blueAccent,
                text: 'Tour Plan',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.moneyBillWave,
                color: const Color(0xFF365486),
                text: 'TA DA',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.umbrellaBeach,
                color: const Color(0xFFA2C579),
                text: 'leave',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.stickyNote,
                color: const Color(0xFF80BCBD),
                text: 'Notice',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.cogs,
                color: const Color(0xFFDF826C),
                text: 'Settings',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.userCheck,
                color: const Color(0xFFC85250),
                text: 'Attendance',
                onTap: () {
                  // Add navigation logic here
                },
              ),
              buildCard(
                icon: FontAwesomeIcons.listCheck,
                color: const Color(0xFFC85250),
                text: 'Today Task',
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
        width: MediaQuery.of(context).size.width / 3 - 10 * 2,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
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
            FaIcon(
              icon,
              size: 60,
              color: color,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
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
