// ignore_for_file: unused_element, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:venturemate/view/screen/options.view.dart';
import 'package:venturemate/view/screen/single_startup_detail.dart';
import 'package:venturemate/view/screen/startup_results.view.dart';

class MyHomePage extends StatefulWidget {
  int homeRoutesIndex = 0;

  MyHomePage({
    Key? key,
    this.homeRoutesIndex = 0,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController locationController = TextEditingController();

  late int homeRoutesIndex;
  late List<Widget> homeRoutes;

    
  void updateHomeRoutesIndex(int index) {
    setState(() {
      homeRoutesIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    homeRoutesIndex = widget.homeRoutesIndex;
    homeRoutes = [
      FilterOptionsView(updateHomeRoutesIndex: updateHomeRoutesIndex),
      searchResultView(updateHomeRoutesIndex: updateHomeRoutesIndex),
      StartupInfoPage(updateHomeRoutesIndex: updateHomeRoutesIndex),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: homeRoutes[homeRoutesIndex],
    );
  }
}
