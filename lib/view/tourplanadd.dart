import 'package:flutter/material.dart';
import 'package:robisalesautomation/main.dart';

import '../utility/mycolors.dart';

class Tourplanadd extends StatefulWidget {
  const Tourplanadd({super.key});

  @override
  State<Tourplanadd> createState() => _TourplanaddState();
}

class _TourplanaddState extends State<Tourplanadd> {
  String selectedOption = 'Please Select';
  List<String> dropdownOptions = [
    'Please Select',
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4'
  ];
  String dbselectedOption = 'Please Select';
  List<String> dbdropdownOptions = [
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
        backgroundColor: Appcolors.primary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            dropdown(context),
            dropdown(context),
            //2nd drop down
          ],
        ),
      ),
    );
  }

  Container dropdown(BuildContext context) {
    return Container(
            width: MediaQuery.of(context).size.width ,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Text("DB  ",
                  style: TextStyle(color: Appcolors.lightwhite,fontSize: 18),
              ),

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
          );
  }
}
