import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
   String selectedOption = 'Please Select';
  List<String> dropdownOptions = [
    'Please Select',
    'Morning',
    'Afternone',
    'Night',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Info",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 248, 56, 88),
        toolbarHeight: 40,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              color: const Color.fromARGB(255, 248, 56, 88),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            margin: EdgeInsets.only(top: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  'February 28',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: "monospace",
                                  ),
                                ),
                                Text(
                                  '2021',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "monospace",
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0),
                            height: 80,
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Text(
                              '12:22 PM',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "monospace",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Additional text at the bottom of the card
                    Center(
                      child: Container(
                        child: Text(
                          'Last time in February 03, 2022 11:19 AM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.white,
                            fontFamily: "monospace",
                      
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
            Container(
          height: 120,
          width: 330,
         child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Shift',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: "monospace",
                      ),
                    ),
                  ),
          
             Container(
            padding: EdgeInsets.only(left:16.0),
            width: 140,
             // Set the width of the Container
            child: DropdownButton<String>(
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Text color
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black, // Dropdown arrow color
              ),
              underline: Container(
                height: 2,
                color: Color.fromARGB(255, 175, 122, 190), // Underline color
              ),
              items: dropdownOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Dropdown item text color
                    ),
                  ),
                );
              }).toList(),
            ),
             )

          ]),
         ),
        ),
        //--->>>>>>>>3rd container start
         Container(

         )     
        ],
      ),
    );
  }
}