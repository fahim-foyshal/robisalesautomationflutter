
import 'package:flutter/material.dart';
import 'package:robisalesautomation/services/notification_service.dart';
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

void main() async{
  await NotificationService.initializeNotification();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Appcolors.lightwhite),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Display the splash screen initially
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
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust animation duration as needed
    );

    // Define animation curve
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    // Start animation
    _animationController.forward();

    // Navigate to the login page after animation completes
    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => loginpage(),
            ),
          );
        }
      },
    );
  }


  @override
  void dispose() {
    // Dispose animation controller
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
          child: Image.asset(
              'assets/images/robilogo.png'), // Display the logo image
        ),
      ),
    );
  }
}
