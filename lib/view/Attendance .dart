import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  late InAppWebViewController _webViewController;
  bool isLoadingImage = false;

  String? imagedata;
  String? location;
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled
        // You can handle this case by showing a dialog or navigating to settings
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Location permission is denied
          // You can handle this case by showing a dialog or asking the user to grant permission
          return;
        }
      }

      currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print("Error getting location: $e");
    }

    if (currentPosition != null) {
      print(currentPosition!.latitude);
      setState(() {
        location =
            "http://192.144.82.199/~mepgroup/1027/sales_mod/pages/report/view_map.php?lat=${currentPosition!.latitude}&long=${currentPosition!.longitude}";
      });
    }
  }

  // void navigateToHome() async {
  //   if (imagedata != null && location != null) {
  //     // Create a Map with the required data
  //     Map<String, dynamic> requestData = {
  //       'user_id': 'user_id_here', // Replace with actual user_id
  //       'do_no': 123, // Replace with actual do_no
  //       'ip': '127.0.0.1', // Replace with actual IP address
  //       'latitude': currentPosition!.latitude,
  //       'longitude': currentPosition!.longitude,
  //       'milage': 'milage_here', // Replace with actual milage
  //       'image': imagedata,
  //     };

  //     // Send the POST request
  //     final response = await http.post(
  //       Uri.parse('url_to_your_api.php'), // Replace with actual URL of your API
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(requestData),
  //     );

  //     // Handle the response
  //     if (response.statusCode == 200) {
  //       // If server returns an OK response, navigate to home screen
  //       print('Data submitted successfully');
  //       // Navigate to home screen
  //     } else {
  //       // If the server did not return a 200 OK response,
  //       // print the error message.
  //       print('Failed to submit data: ${response.body}');
  //     }
  //   } else {
  //     // If either image or location is missing, show an error message
  //     print('Please capture an image and wait for the location to be fetched.');
  //   }
  // }

  void navigateToHome() async {
    if (imagedata != null && location != null) {
      try {
        FormData formData = FormData.fromMap({
          'user_id': '100004', // Replace with actual user_id
          'do_no': 123, // Replace with actual do_no
          'ip': '127.0.0.1', // Replace with actual IP address
          'latitude': currentPosition!.latitude,
          'longitude': currentPosition!.longitude,
          'milage': 'milage_here', // Replace with actual milage
          'image': await MultipartFile.fromFile(imagedata!),
        });
        print(imagedata);
        Dio dio = Dio();
        Response response = await dio.post(
          'https://starlineerp.com/CloudERP/sec_mod/api/api_ss_attendance.php', // Replace with actual URL of your API
          data: formData,
        );

        if (response.statusCode == 200) {
          print(response.data);
          // Navigate to home screen
        } else {
          print('Failed to submit data: ${response.data}');
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {
      print('Please capture an image and wait for the location to be fetched.');
    }
  }

  void handleImageUpload() async {
    final picker = ImagePicker();
    setState(() {
      isLoadingImage = true; // Set loading state to true
    });
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        imagedata = pickedFile.path;
        isLoadingImage =
            false; // Set loading state to false when image is loaded
      });

      print("Image URL: $imagedata");
    } else {
      setState(() {
        isLoadingImage =
            false; // Set loading state to false if image picking is canceled
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
        backgroundColor: Colors.blue,
        toolbarHeight: 40,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(10),
            // width: MediaQuery.of(context).size.width / 3 - 10 * 2,
            height: MediaQuery.of(context).size.height / 4,
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
            child: location != null
                ? InAppWebView(
                    initialUrlRequest: URLRequest(url: WebUri(location!)))
                : Container(),
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
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
            child: isLoadingImage
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : imagedata != null
                    ? Image.file(
                        File(imagedata!),
                        fit: BoxFit.fill,
                      )
                    : Container(
                        child: GestureDetector(
                          onTap: handleImageUpload,
                          child: const Center(
                              child: FaIcon(
                            FontAwesomeIcons.camera,
                          )),
                        ),
                      ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: navigateToHome,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
