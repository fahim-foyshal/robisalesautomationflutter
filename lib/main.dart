// import 'package:employe_portal/homepage.dart';
import 'package:flutter/material.dart';
import 'package:robisalesautomation/view/HomepageAndMenuHolder.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'homepage',
    routes: {'homepage': (context) => HomepageAndMenuHolder()},
  ));
}
