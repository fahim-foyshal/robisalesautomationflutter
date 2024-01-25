import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robisalesautomation/model/DistributorData.dart';
import 'package:robisalesautomation/view/detailedfeatures.dart';

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
      distributrname: "Ashraful Haque",
      distributrcode: 'BDFD86678',
      image:
          'https://scontent.fjsr3-1.fna.fbcdn.net/v/t39.30808-6/323553409_520959646495059_5922646752088678591_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeFZ5dXqQPcCmvhQuj6tsOXs-JQG_R9H___4lAb9H0f___6EqxLO61gfEoO_EygJ3LXcndjUvZqeBEhT8-k-a4uz&_nc_ohc=W_tU1BSKJzsAX8jJ7L9&_nc_ht=scontent.fjsr3-1.fna&oh=00_AfBpfLucfSrP5s6WPFbUmBEWLgvWuav_98zCyHtJFz960g&oe=65B3E231',
    ),
  ];
}

class _DistributerListState extends State<DistributerList>
    with SingleTickerProviderStateMixin {
  bool isFilterSheetVisible = false;
  final TextEditingController searchController = TextEditingController();
  List<DistributorData> filteredList = [];
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  void handleBottomSheetPress() {
    setState(() {
      isFilterSheetVisible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the filteredList with the original data
    filteredList = List.from(DistributerList.distributorDataList);

    // Animation setup
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start animation when the widget is first built
    _animationController.forward();
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
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth - 120,
                  height: 40,
                  padding: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.white,
                        child: const FaIcon(FontAwesomeIcons.search,
                            size: 25, color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search for distributor',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            setState(() {
                              // Filter the distributorDataList based on the search input
                              filteredList = DistributerList.distributorDataList
                                  .where((distributor) =>
                                      distributor.distributrname
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      distributor.distributrcode
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                  .toList();

                              // Reset animation when filtering
                              _animationController.reset();
                              _animationController.forward();
                            });
                          },
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SlideTransition(
                position: _slideAnimation,
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) => buildCard(
                    distributrname: filteredList[index].distributrname,
                    distributrcode: filteredList[index].distributrcode,
                    image: filteredList[index].image,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detailedfeatures(
                            distributorData: filteredList[index],
                          ),
                        ),
                      );
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
