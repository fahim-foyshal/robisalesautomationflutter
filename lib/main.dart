// import 'package:employe_portal/homepage.dart';
import 'package:flutter/material.dart';
import 'package:robisalesautomation/view/homepage.dart';
import 'package:robisalesautomation/view/orderdelivery.dart';

import 'view/detailedfeatures.dart';
import 'view/tourplanadd.dart';

class Appcolors {
  static const Color primary = const Color(0xFFe63946);
  static const Color secondary = const Color(0xFFa8dadc);
  static const Color lightwhite = const Color(0xFFf1faee);
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {'homepage': (context) => Homepage()},
      // routes: {'homepage': (context) => Tourplanadd()},
    ),
  );
}
