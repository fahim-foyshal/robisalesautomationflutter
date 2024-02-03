import 'package:flutter/material.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

class Doholdpage extends StatefulWidget {
  const Doholdpage({super.key});

  @override
  State<Doholdpage> createState() => _DoholdpageState();
}

class _DoholdpageState extends State<Doholdpage> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];
  final List<String> shopnamrs = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  // Helper function to add leading zero if necessary
  String _addLeadingZero(int value) {
    return value < 10 ? '0$value' : '$value';
  }
  String _getCurrentDateAndTime() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.year)}';
    String formattedTime = '${_get12HourFormat(now.hour)}:${_addLeadingZero(now.minute)}:${_addLeadingZero(now.second)} ${_getAMPM(now.hour)}';
    return '$formattedDate $formattedTime';
  }

  String _get12HourFormat(int hour) {
    int hour12 = hour > 12 ? hour - 12 : hour;
    return _addLeadingZero(hour12);
  }

  String _getAMPM(int hour) {
    return hour >= 12 ? 'PM' : 'AM';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Do Hold',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "monospace",
          ),
        ),
        backgroundColor: Appcolors.primary,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            String currentDateAndTime = _getCurrentDateAndTime();

            return InkWell(
              onTap: (){
                //add onTap code .
              },
              child: Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text("DO Number ${items[index]}"),
                  subtitle: Text(currentDateAndTime),
                  trailing: Text("Shopname ${shopnamrs[index]}"),
                  onTap: () {
                    // Handle item tap (e.g., navigate to a details screen)
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
