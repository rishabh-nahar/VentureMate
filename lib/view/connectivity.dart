import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:venturemate/view/screen/home.view.dart';
import 'package:venturemate/view/signup.view.dart';
import 'package:venturemate/view/splash.view.dart';


class checInternetkConnectivity extends StatefulWidget {
  checInternetkConnectivity({super.key});
  @override
  State<checInternetkConnectivity> createState() => _cheInternetckConnectivityState();
}

class _cheInternetckConnectivityState extends State<checInternetkConnectivity> {
  bool checkConnection = checkInternetConnectivity();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => checkConnection ? MyHomePage() : SignupView(),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

checkInternetConnectivity() async {
  final ConnectivityResult connectivityResult =
      await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}
