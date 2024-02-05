import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:robisalesautomation/model/DistributorData.dart';
import 'package:robisalesautomation/view/dohold.dart';
import 'package:robisalesautomation/view/openshops.dart';
import 'package:robisalesautomation/view/orderdelivery.dart';
import 'package:robisalesautomation/view/orderlist.dart';
import 'package:robisalesautomation/view/tourplanadd.dart';

import '../utility/mycolors.dart';

class Detailedfeatures extends StatefulWidget {
  final DistributorData distributorData;
  const Detailedfeatures({Key? key, required this.distributorData})
      : super(key: key);
  @override
  State<Detailedfeatures> createState() => _DetailedfeaturesState();
}
class _DetailedfeaturesState extends State<Detailedfeatures> {
  @override
  Widget build(BuildContext context) {
    DistributorData distributorData = widget.distributorData;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Distributor Details",
          style: TextStyle(color: Colors.white,fontFamily: "monospace",),
        ),
        backgroundColor: Appcolors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_backup_restore,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  height: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),

                    color: Appcolors.secondary,
     ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //image Container
                      Container(
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.only(left: 4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.network(
                            distributorData.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Text in the middle
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                          ),
                          Text(
                            "Name:${distributorData.distributrname}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            distributorData.distributrcode,
                            style: const TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          const Text(
                            'Credit Limit:00000000.0',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          const Text(
                            'Due:0000000',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          const Text(
                            'Available Credit Limit :000000000.0000000000000',
                            softWrap: true,
                            style: TextStyle(fontSize: 12, color: Colors.white),
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
                      icon: const Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: [
                  buildCard(
                    icon: FontAwesomeIcons.cartPlus,
                    color: Colors.purple,
                    text: 'Add Order',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Tourplanadd()),
                      );
                    },
                  ),
                  buildCard(
                    icon: FontAwesomeIcons.list,
                    color: const Color(0xFFD9EDBF),
                    text: 'Order List',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Orderlist(
                          ),
                        ),
                      );
                    },
                  ),
                  buildCard(
                    icon: FontAwesomeIcons.mapLocationDot,
                    color: const Color(0xFF6B240C),
                    text: 'Update Location',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddShopPage(

                          ),
                        ),
                      );
                    },
                  ),
                  buildCard(
                    icon: FontAwesomeIcons.fileInvoiceDollar,
                    color: const Color(0xFFFF4A4F),
                    text: 'Payment List',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Doholdpage()),
                      );
                    },
                  ),
                  buildCard(
                    icon: FontAwesomeIcons.clipboardList,
                    color: Colors.blueAccent,
                    text: 'Stock List',
                    onTap: () {
                      // Add navigation logic here
                    },
                  ),
                  buildCard(
                    icon: FontAwesomeIcons.listCheck,
                    color: const Color(0xFF365486),
                    text: 'Visit List',
                    onTap: () {

                    },
                  ),
                  // Add more cards as needed
                  // ...
                ],
              ),
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
          borderRadius: BorderRadius.circular(20),
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
