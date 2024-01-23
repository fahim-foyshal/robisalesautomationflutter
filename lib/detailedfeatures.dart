import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Detailedfeatures extends StatefulWidget {
  const Detailedfeatures({Key? key}) : super(key: key);

  @override
  State<Detailedfeatures> createState() => _DetailedfeaturesState();
}

class _DetailedfeaturesState extends State<Detailedfeatures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Distributor Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 248, 56, 88),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_backup_restore,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color.fromARGB(255, 248, 56, 88),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //image Container
                        Container(
                          width: 60,
                          height: 60,
                          padding: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                              'https://example.com/your_image_path.jpg'),
                        ),
                        // Text in the middle
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                            ),
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Code:000000',
                              style:
                              TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            Text(
                              'Credit Limit:00000000.0',
                              style:
                              TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            Text(
                              'Due:0000000',
                              style:
                              TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            Text(
                              'Available Credit Limit :000000000.0000000000000',
                              softWrap: true,
                              style:
                              TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_drop_down_circle_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: [
                buildCard(
                  icon: FontAwesomeIcons.building,
                  color: Colors.purple,
                  text: 'Add Order',
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => DistributerList()),
                    // );
                  },
                ),
                buildCard(
                  icon: FontAwesomeIcons.shop,
                  color: const Color(0xFFD9EDBF),
                  text: 'Order List',
                  onTap: () {
                    // Add navigation logic here
                  },
                ),
                buildCard(
                  icon: FontAwesomeIcons.bullseye,
                  color: const Color(0xFF6B240C),
                  text: 'Update Location',
                  onTap: () {
                    // Add navigation logic here
                  },
                ),
                buildCard(
                  icon: FontAwesomeIcons.info,
                  color: const Color(0xFFFF4A4F),
                  text: 'Payment List',
                  onTap: () {
                    // Add navigation logic here
                  },
                ),
                buildCard(
                  icon: FontAwesomeIcons.mapLocation,
                  color: Colors.blueAccent,
                  text: 'Stock List',
                  onTap: () {
                    // Add navigation logic here
                  },
                ),
                buildCard(
                  icon: FontAwesomeIcons.moneyBillWave,
                  color: const Color(0xFF365486),
                  text: 'Visit List',
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
