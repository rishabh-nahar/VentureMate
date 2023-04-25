import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/screen/home.view.dart';
import 'package:venturemate/view/screen/layout.view.dart';
import 'package:venturemate/view/signup.view.dart';

class SplashView extends StatelessWidget {

  bool isLoggedIn = false;
  SplashView({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    Timer(const Duration(seconds: 2), () {
      Get.off(() => isLoggedIn ? LayoutView(isLoggedIn: isLoggedIn ) : SignupView());
      });
    return Scaffold(
      backgroundColor: GlobalColors.primaryColor,
      body: Center(
        child: Text(
          "Venture Mate",
          style: TextStyle(
            color: GlobalColors.lightThemeColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     
    );
  }
}