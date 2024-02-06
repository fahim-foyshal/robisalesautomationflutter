import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:robisalesautomation/model/User.dart';
import 'package:robisalesautomation/sqldatabasees/UserDatabase.dart';
import 'package:robisalesautomation/utility/mycolors.dart';
import 'package:robisalesautomation/view/ProfileInfo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  User? currentUser;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    UserDatabase userDatabase = UserDatabase();
    User? user = await userDatabase.getUser();
    if (user != null) {
      setState(() {
        currentUser = user;
      });
    }
  }

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
    const Color.fromARGB(255, 198, 228, 68),
    const Color.fromARGB(255, 90, 22, 23),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileInfo()),
                )
              },
              child: Container(
                height: 150,
                child: Card(
                  margin: const EdgeInsets.only(top: 30, left: 13, right: 13),
                  color: Appcolors.secondary,
                  elevation: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        // You can replace the Image.network with your actual image loading logic
                        child: ClipOval(
                          child: Image.network(
                            currentUser?.userImage ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentUser?.fullName ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: "monospace",
                            ),
                          ),
                          const Text(
                            'sales manager',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: "DMMono-Regular",
                            ),
                          ),
                          const Text(
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                margin: const EdgeInsets.only(top: 30, left: 13, right: 13),
                // color: Colors.deepPurple[300],
                elevation: 20,
                color: Appcolors.lightwhite,

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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

                        progressColor: Appcolors.primary,
                        center: const Center(
                          child: Text("40%",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),

                        backgroundColor: Colors.deepPurple.shade100,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22, top: 60),
                          child: Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const Text(" Target : 100000",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const Text(" Completed : 40000",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      ],
                    )
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
                color: Appcolors.lightwhite,

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25, top: 25),
                      child: PieChart(
                        dataMap: weeklydata,
                        colorList: colorlist,
                        chartRadius: 200,
                        animationDuration: Durations.extralong3,
                        chartValuesOptions: const ChartValuesOptions(
                            showChartValues: true,
                            showChartValuesOutside: true),
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
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
