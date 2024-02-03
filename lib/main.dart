import 'package:flutter/material.dart';
import 'package:robisalesautomation/sqldatabasees/UserDatabase.dart';
import 'package:robisalesautomation/view/HomepageAndMenuHolder.dart';
import 'package:robisalesautomation/view/LoginScreen%20.dart';
import 'package:robisalesautomation/view/loginpage.dart';

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
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => LoginScreen(),
        '/homepage': (context) => HomepageAndMenuHolder(),
        // Add other routes as needed
      },
    );
  }
}
