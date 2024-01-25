import 'package:flutter/material.dart';
import 'package:robisalesautomation/model/AllMenuContent.dart';
import 'package:robisalesautomation/view/homepage.dart';

class HomepageAndMenuHolder extends StatefulWidget {
  const HomepageAndMenuHolder({super.key});

  @override
  State<HomepageAndMenuHolder> createState() => _HomepageAndMenuHolderState();
}

class _HomepageAndMenuHolderState extends State<HomepageAndMenuHolder> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 10,
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: [
          Homepage(),
          AllMenuContent(),
        ],
      ),
    );
  }
}
