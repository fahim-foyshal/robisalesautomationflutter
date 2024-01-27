// import 'package:employe_portal/homepage.dart';
import 'package:flutter/material.dart';

import 'package:robisalesautomation/utility/mycolors.dart';
import 'package:robisalesautomation/view/homepage.dart';
import 'package:robisalesautomation/view/loginpage.dart';
import 'package:robisalesautomation/view/orderdelivery.dart';

import 'package:robisalesautomation/view/HomepageAndMenuHolder.dart';


void main() {
  runApp(MaterialApp(
    theme: new ThemeData(scaffoldBackgroundColor: Appcolors.lightwhite),
    debugShowCheckedModeBanner: false,
    initialRoute: 'homepage',

    routes: {'homepage': (context) => loginpage()},

  ));
}
