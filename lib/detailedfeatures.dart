import 'package:flutter/material.dart';

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
                    height: 180,
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
                          padding: EdgeInsets.only(right: 8),
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
          ],
        ),
      ),
    );
  }
}
