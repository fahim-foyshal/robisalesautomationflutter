
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:robisalesautomation/utility/mycolors.dart';
import 'package:robisalesautomation/view/loginpage.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       theme: new ThemeData(scaffoldBackgroundColor: Appcolors.lightwhite),
//       debugShowCheckedModeBanner: false,
//       initialRoute: 'homepage',
//       routes: {'homepage': (context) => loginpage()},
//     ),
//   );
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Appcolors.lightwhite),
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {'homepage': (context) => SplashScreen()}, // Display the splash screen initially
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the login page after a certain duration
    Timer(
      const Duration(seconds: 3), // Change the duration as per your requirement
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const loginpage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.lightwhite,
      body: Center(
        child:
            Image.asset('assets/images/robilogo.png'), // Display the logo image
      ),
    );
  }
}
