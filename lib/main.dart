// import 'package:employe_portal/homepage.dart';
import 'package:flutter/material.dart';
import 'package:robisalesautomation/view/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'homepage',
    routes: {'homepage': (context) => Homepage()},
    // routes: {'homepage': (context) => Detailedfeatures()},
  ));
}
