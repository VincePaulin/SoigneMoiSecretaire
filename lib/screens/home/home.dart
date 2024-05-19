import 'package:flutter/material.dart';

import 'home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeController createState() => HomeController();
}

class HomeController extends State<Home> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void updateIndex(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      controller: this,
    );
  }
}
