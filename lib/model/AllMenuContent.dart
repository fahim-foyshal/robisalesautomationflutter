import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robisalesautomation/view/Attendance%20.dart';
import 'package:robisalesautomation/view/distributer.dart';

class AllMenuContent extends StatefulWidget {
  const AllMenuContent({super.key});

  @override
  State<AllMenuContent> createState() => _AllMenuContentState();
}

class _AllMenuContentState extends State<AllMenuContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
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
                MaterialPageRoute(
                    builder: (context) => const DistributerList()),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Attendance()),
              );
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
          buildCard(
            icon: FontAwesomeIcons.plus,
            color: const Color(0xFFC85250),
            text: 'Add order',
            onTap: () {
              // Add navigation logic here
            },
          ),
          buildCard(
            icon: FontAwesomeIcons.shopLock,
            color: const Color(0xFFC85250),
            text: 'Add shop',
            onTap: () {
              // Add navigation logic here
            },
          ),
          // Add more cards as needed
          // ...
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
        height: MediaQuery.of(context).size.height / 6 - 10 * 2,
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
