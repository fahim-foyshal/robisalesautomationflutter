// import 'package:employe_portal/homepage.dart';
import 'package:flutter/material.dart';
import 'package:robisalesautomation/view/HomepageAndMenuHolder.dart';
import 'package:robisalesautomation/view/homepage.dart';
import 'package:robisalesautomation/view/orderdelivery.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'homepage',
    routes: {'homepage': (context) => HomepageAndMenuHolder()},
  ));

}
