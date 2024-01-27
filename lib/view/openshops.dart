// Import the necessary libraries
import 'package:flutter/material.dart';
import 'package:robisalesautomation/utility/mycolors.dart';

// Create a new StatefulWidget class
class AddShopPage extends StatefulWidget {
  @override
  _AddShopPageState createState() => _AddShopPageState();
}

// Create a corresponding State class
class _AddShopPageState extends State<AddShopPage> {
  // Define variables to store the entered shop details
  String _shopName = '';
  String _shopAddress = '';
  String _ownername = '';
  String  _ownernumber = '';
  String _managername = '';
  String  _managernumber = '';

  // Define methods to handle user input
  void onShopNameChanged(String value) {
    setState(
      () {
        _shopName = value;
      },
    );
  }

  void onShopAddressChanged(String value) {
    setState(
          () {
        _shopAddress = value;
      },
    );
  }
  void onShopOwnerNameChanged(String value) {
    setState(
          () {
            _ownername = value;
      },
    );
  }
  void onShopOwnerNumberChnangd(String value) {
    setState(
          () {
        _ownernumber= value;
      },
    );
  }
  void onShopManagerNameChanged(String value) {
    setState(
          () {
        _managername = value;
      },
    );
  }
  void onShopManagerNumberChanged(String value) {
    setState(
          () {
        _managernumber= value;
      },
    );
  }

  String selectedOption1 = 'Please Select';
  List<String> dropdownOptions1 = [
    'Please Select',
    'Route 01',
    'Route 02',
    'Route 03',
  ];

  String selectedOption2 = 'Please Select';
  List<String> dropdownOptions2 = [
    'Please Select',
    'Option 1',
    'Option 2',
    'Option 3',
  ];
  String selectedOption3 = 'Please Select';
  List<String> dropdownOptions3 = [
    'Please Select',
    'Option 1',
    'Option 2',
    'Option 3',
  ];
  String selectedOption4 = 'Please Select';
  List<String> dropdownOptions4 = [
    'Please Select',
    'Option 1',
    'Option 2',
    'Option 3',
  ];
  String selectedOption5 = 'Please Select';
  List<String> dropdownOptions5 = [
    'Please Select',
    'Option 1',
    'Option 2',
    'Option 3',
  ];
  String selectedOption6 = 'Please Select';
  List<String> dropdownOptions6 = [
    'Please Select',
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Shop',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "monospace",
          ),
        ),
        backgroundColor: Appcolors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Add image picker widget here
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement image picking logic here
                  },
                  child: const Text(
                    'Add Image',
                    style: TextStyle(
                      fontFamily: "monospace",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Card(
                color: Colors.white,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Shop Name',
                    ),
                    onChanged: onShopNameChanged,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Zone Division Territory
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.white,
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Zone:"),
                        SizedBox(height: 10.0),
                        Text("Division:"),
                        SizedBox(height: 10.0),
                        Text("Territory:")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Route Name dropdown
              Card(
                color: Colors.white,
                elevation: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Route Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "monospace",
                          ),
                        ),
                        DropdownButton<String>(
                          value: selectedOption1,
                          onChanged: (String? newValue) {
                            setState(
                                  () {
                                selectedOption1 = newValue!;
                              },
                            );
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, // Text color
                          ),
                          dropdownColor: Appcolors.secondary,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Appcolors.primary, // Dropdown arrow color
                          ),
                          underline: Container(
                            height: 2,
                            color: Appcolors.secondary, // Underline color
                          ),
                          isExpanded: true,
                          // Make the dropdown width match the device width
                          hint: Text(
                            'Enter the Route Name', // Placeholder text
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // Placeholder text color
                            ),
                          ),
                          items: dropdownOptions1.map(
                                (String option) {
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
                            },
                          ).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Shop Address Name
              Card(
                color: Colors.white,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Shop Address',
                      labelStyle: TextStyle(),
                    ),
                    onChanged: onShopAddressChanged,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Shop owner Name
              Card(
                color: Colors.white,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Shop Owner Name',
                      labelStyle: TextStyle(),
                    ),
                    onChanged: onShopOwnerNameChanged,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Shop owner mobile
              Card(
                color: Colors.white,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Shop Owner Mobile',
                      labelStyle: TextStyle(),
                    ),
                    onChanged: onShopOwnerNumberChnangd,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Shop Manager Name
              Card(
                color: Colors.white,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Shop Manager Name',
                      labelStyle: TextStyle(),
                    ),
                    onChanged: onShopManagerNameChanged,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Shop Manager mobile
              Card(
                color: Colors.white,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Shop Manager Mobile',
                      labelStyle: TextStyle(),
                    ),
                    onChanged: onShopManagerNumberChanged,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Route Name dropdown
              Card(
                color: Colors.white,
                elevation: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop identity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "monospace",
                          ),
                        ),
                        DropdownButton<String>(
                          value: selectedOption2,
                          onChanged: (String? newValue) {
                            setState(
                                  () {
                                selectedOption2 = newValue!;
                              },
                            );
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, // Text color
                          ),
                          dropdownColor: Appcolors.secondary,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Appcolors.primary, // Dropdown arrow color
                          ),
                          underline: Container(
                            height: 2,
                            color: Appcolors.secondary, // Underline color
                          ),
                          isExpanded: true,
                          // Make the dropdown width match the device width
                          items: dropdownOptions2.map(
                                (String option) {
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
                            },
                          ).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Route Name dropdown
              Card(
                color: Colors.white,
                elevation: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop Class',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "monospace",
                          ),
                        ),
                        DropdownButton<String>(
                          value: selectedOption3,
                          onChanged: (String? newValue) {
                            setState(
                                  () {
                                selectedOption3 = newValue!;
                              },
                            );
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, // Text color
                          ),
                          dropdownColor: Appcolors.secondary,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Appcolors.primary, // Dropdown arrow color
                          ),
                          underline: Container(
                            height: 2,
                            color: Appcolors.secondary, // Underline color
                          ),
                          isExpanded: true,
                          // Make the dropdown width match the device width
                          hint: Text(
                            'Enter the Route Name', // Placeholder text
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // Placeholder text color
                            ),
                          ),
                          items: dropdownOptions3.map(
                                (String option) {
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
                            },
                          ).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Route Name dropdown
              Card(
                color: Colors.white,
                elevation: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop Type',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "monospace",
                          ),
                        ),
                        DropdownButton<String>(
                          value: selectedOption4,
                          onChanged: (String? newValue) {
                            setState(
                                  () {
                                selectedOption4 = newValue!;
                              },
                            );
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, // Text color
                          ),
                          dropdownColor: Appcolors.secondary,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Appcolors.primary, // Dropdown arrow color
                          ),
                          underline: Container(
                            height: 2,
                            color: Appcolors.secondary, // Underline color
                          ),
                          isExpanded: true,
                          // Make the dropdown width match the device width
                          hint: Text(
                            'Enter the Route Name', // Placeholder text
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // Placeholder text color
                            ),
                          ),
                          items: dropdownOptions4.map(
                                (String option) {
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
                            },
                          ).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //Route Name dropdown
              Card(
                color: Colors.white,
                elevation: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop Channel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "monospace",
                          ),
                        ),
                        DropdownButton<String>(
                          value: selectedOption5,
                          onChanged: (String? newValue) {
                            setState(
                                  () {
                                selectedOption5 = newValue!;
                              },
                            );
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, // Text color
                          ),
                          dropdownColor: Appcolors.secondary,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Appcolors.primary, // Dropdown arrow color
                          ),
                          underline: Container(
                            height: 2,
                            color: Appcolors.secondary, // Underline color
                          ),
                          isExpanded: true,
                          // Make the dropdown width match the device width
                          hint: Text(
                            'Enter the Route Name', // Placeholder text
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // Placeholder text color
                            ),
                          ),
                          items: dropdownOptions5.map(
                                (String option) {
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
                            },
                          ).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Card(
                color: Colors.white,
                elevation: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop Route Type',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "monospace",
                          ),
                        ),
                        DropdownButton<String>(
                          value: selectedOption6,
                          onChanged: (String? newValue) {
                            setState(
                                  () {
                                selectedOption6 = newValue!;
                              },
                            );
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, // Text color
                          ),
                          dropdownColor: Appcolors.secondary,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Appcolors.primary, // Dropdown arrow color
                          ),
                          underline: Container(
                            height: 2,
                            color: Appcolors.secondary, // Underline color
                          ),
                          isExpanded: true,
                          // Make the dropdown width match the device width
                          hint: Text(
                            'Enter the Route Name', // Placeholder text
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // Placeholder text color
                            ),
                          ),
                          items: dropdownOptions6.map(
                                (String option) {
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
                            },
                          ).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              // Submit and Discard btn
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 8.0, // Adjust the elevation
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),

                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 8.0, // Adjust the elevation
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        "Discard",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              // Implement dropdown menus for zone, division, and territory here
            ],
          ),
        ),
      ),
    );
  }
}
