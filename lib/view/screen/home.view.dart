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
  
  // For search
  static String indVertical = "";
  static String fundingType = "";
  static String location = "";
  
  // To display result
  String startupName = '';
  double startupInvestmentInUSD = 0;
  String startupIndustryVertical = "";
  String startupLocation = "";

    
  void updateHomeRoutesIndexWithData(int index, List<String>data) {
    setState(() {
      location = data[0];
      indVertical = data[1];
      fundingType = data[2];
      print("Data: ${location}");
      updateHomeRoutesIndex(index);
    });
  }
    void updateHomeRoutesIndexForSingleStartupPage(int index, String startup_name, double investment_in_USD, String industry_vertical, String location_) {
    print("${startup_name} ${investment_in_USD} ${location_}");
    setState(() {
      startupName = startup_name;
      
      startupInvestmentInUSD = investment_in_USD;
      startupIndustryVertical = industry_vertical;
      startupLocation = location_;

      updateHomeRoutesIndex(index);
    });
  }
  void updateHomeRoutesIndex(int index) {
    setState(() {
      homeRoutesIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    homeRoutesIndex = widget.homeRoutesIndex;
  }
  @override
  Widget build(BuildContext context) {
  homeRoutes = [
    FilterOptionsView(updateHomeRoutesIndexWithData: updateHomeRoutesIndexWithData),
    searchResultView(updateHomeRoutesIndex: updateHomeRoutesIndex,updateHomeRoutesIndexForSingleStartupPage:updateHomeRoutesIndexForSingleStartupPage, location: location, indVertical: indVertical, fundingType:fundingType),
    StartupInfoPage(updateHomeRoutesIndex: updateHomeRoutesIndex, startupName: startupName,investment_in_USD: startupInvestmentInUSD, location: startupLocation, industryVertical: startupIndustryVertical),
  ];
    return Container(
      child: homeRoutes[homeRoutesIndex],
    );
  }
}
