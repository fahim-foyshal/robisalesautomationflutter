import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DistributerList extends StatefulWidget {
  const DistributerList({Key? key}) : super(key: key);

  @override
  State<DistributerList> createState() => _DistributerListState();
  static List<DistributorData> distributorDataList = [
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    DistributorData(
      distributrname: "fahim foysal",
      distributrcode: 'ADFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
    ),
    // Add more DistributorData objects as needed
  ];
}

class DistributorData {
  final String distributrname;
  final String distributrcode;
  final String image;

  DistributorData({
    required this.distributrname,
    required this.distributrcode,
    required this.image,
  });
}

class _DistributerListState extends State<DistributerList> {
  bool isFilterSheetVisible = false;

  void handleBottomSheetPress() {
    setState(() {
      isFilterSheetVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 56, 88),
        toolbarHeight: 10,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 248, 56, 88),
              borderRadius: BorderRadius.only(),
            ), // Set the width to the screen width
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth - 120, // Adjusted width for search box
                  height: 40,
                  padding: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.white, // White background for the icon
                        child: const FaIcon(FontAwesomeIcons.search,
                            size: 25, color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for distributer',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: handleBottomSheetPress,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(2, 132, 199, 255),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const FaIcon(FontAwesomeIcons.sliders,
                        size: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(
          //     children: [
          //       buildCard(
          //         distributrname: "fahim foysal",
          //         distributrcode: 'ADFD86678',
          //         image:
          //             'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/318176744_1594740380986400_5480603979965264423_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeEonnVBi6BxR_ua7QYZLzswqAXar8ezdsKoBdqvx7N2wu7Fy4kDb6kS_vUlg75dMLnuLuWIf5z6rbyYMUZrCPSF&_nc_ohc=g2soalCbrsAAX9AxZqU&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfDI-B6womtnMPiQ-2A-RmNhTGtfJMntyqljKM4luyTMHg&oe=65B405D1',
          //         onTap: () {
          //           // Navigator.push(
          //           //   context,
          //           //   MaterialPageRoute(builder: (context) => DistributerList()),
          //           // );
          //         },
          //       ),
          //     ],
          //   ),
          // ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: List.generate(
                  DistributerList.distributorDataList.length,
                  (index) => buildCard(
                    distributrname: DistributerList
                        .distributorDataList[index].distributrname,
                    distributrcode: DistributerList
                        .distributorDataList[index].distributrcode,
                    image: DistributerList.distributorDataList[index].image,
                    onTap: () {
                      // Handle card tap if needed
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required String distributrname,
    required String distributrcode,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        distributrname,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 248, 56, 88),
                        ),
                      ),
                      Text(
                        distributrcode,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
