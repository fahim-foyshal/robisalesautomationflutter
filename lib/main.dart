// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:robisalesautomation/sqldatabasees/UserDatabase.dart';
import 'package:robisalesautomation/utility/mycolors.dart';
import 'package:robisalesautomation/view/HomepageAndMenuHolder.dart';
import 'package:robisalesautomation/view/LoginScreen%20.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Instantiate UserDatabase to check if the user is logged in
  UserDatabase userDatabase = UserDatabase();
  bool isUserLoggedIn = await userDatabase.isUserLoggedIn();

  runApp(MyApp(initialRoute: isUserLoggedIn ? '/homepage' : '/login'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/homepage': (context) => HomepageAndMenuHolder(),
        // Add other routes as needed
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    _animationController.forward();

    _animationController.addStatusListener(
      (status) async {
        if (status == AnimationStatus.completed) {
          UserDatabase userDatabase = UserDatabase();
          bool isUserLoggedIn = await userDatabase.isUserLoggedIn();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => isUserLoggedIn
                  ? const HomepageAndMenuHolder()
                  : LoginScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.lightwhite,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset('assets/images/starline.png'),
        ),
      ),
    );
  }
}
