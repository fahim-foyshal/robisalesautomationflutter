import 'package:flutter/material.dart';

class Tourplanadd extends StatefulWidget {
  const Tourplanadd({super.key});

  @override
  State<Tourplanadd> createState() => _TourplanaddState();
}

class _TourplanaddState extends State<Tourplanadd> {
  String selectedOption = 'Option 1';
  List<String> dropdownOptions = [
    'Please Select',
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tour Plan Add",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 248, 56, 88),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.70,
            //   padding: EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   child: Column(children: [
            //     Text("Selected Option: $selectedOption",
            //         style: TextStyle(fontSize: 18)),
            //     // SizedBox(height: 20),
            //     DropdownButton<String>(
            //       value: selectedOption,
            //       onChanged: (String? newValue) {
            //         setState(
            //               () {
            //             selectedOption = newValue!;
            //           },
            //         );
            //       },
            //       items: dropdownOptions.map((String option) {
            //         return DropdownMenuItem<String>(
            //           value: option,
            //           child: Text(option),
            //         );
            //       }).toList(),
            //     ),
            //   ]),
            // ),
            Container(
              width: MediaQuery.of(context).size.width * 0.70,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(children: [
                Text("Selected Option: $selectedOption",
                    style: TextStyle(fontSize: 18)),
                // SizedBox(height: 20),
                DropdownButton<String>(
                  value: selectedOption,
                  onChanged: (String? newValue) {
                    setState(
                      () {
                        selectedOption = newValue!;
                      },
                    );
                  },
                  items: dropdownOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
