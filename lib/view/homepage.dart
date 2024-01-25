import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:robisalesautomation/view/Attendance%20.dart';

import 'package:robisalesautomation/main.dart';

import 'package:robisalesautomation/view/distributer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map<String, double> weeklydata = {
    "Sat": 2000,
    "Sun": 7000,
    "Mon": 3000,
    "Tue": 5000,
    "Wed": 1000,
    "Thu": 500,
    "Fri": 9000,
  };

  List<Color> colorlist = [
    const Color(0xFF386641),
    const Color(0xFFdb504a),
    const Color(0xFF6a994e),
    const Color(0xFFf2e8cf),
    const Color(0xFFa7c957),
    Color.fromARGB(255, 198, 228, 68),
    Color.fromARGB(255, 90, 22, 23),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        // backgroundColor: const Color.fromARGB(255, 248, 56, 88),
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: Card(
                margin: const EdgeInsets.only(top: 30, left: 13, right: 13),
                color: Colors.deepPurple[300],
                elevation: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      // You can replace the Image.network with your actual image loading logic
                      child: ClipOval(
                        child: Image.network(
                          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
                          fit: BoxFit.cover,
                        ),
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                margin: const EdgeInsets.only(top: 30, left: 13, right: 13),
                // color: Colors.deepPurple[300],
                elevation: 20,

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularPercentIndicator(
                        animation: true,
                        // restartAnimation: true,
                        // animateFromLastPercent: false,
                        animationDuration: 2000,
                        radius: 90,
                        lineWidth: 22,
                        percent: 0.4,
                        progressColor: Colors.deepPurple,
                        backgroundColor: Colors.deepPurple.shade100,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                margin: EdgeInsets.only(top: 30, left: 13, right: 13),
                // color: Colors.deepPurple[300],
                elevation: 20,

                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 25, top: 25),
                      child: PieChart(
                        dataMap: weeklydata,
                        colorList: colorlist,
                        chartRadius: 200,
                        animationDuration: Durations.extralong3,
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValues: true,
                            showChartValuesOutside: true),
                        legendOptions:
                            LegendOptions(legendPosition: LegendPosition.left),
                      ),
                    ),
                  ],
                ),
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
                      MaterialPageRoute(
                          builder: (context) => const Attendance()),
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
                // Add more cards as needed
                // ...
              ],
            ),
          ],
        ),
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
