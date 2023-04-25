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
   
    Timer(const Duration(seconds: 5), () {
      Get.off(() => isLoggedIn ? LayoutView(isLoggedIn: isLoggedIn ) : SignupView());
      });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/image-bank/startup.gif",
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Text(
                "Venture Mate",
                style: TextStyle(
                  color: GlobalColors.primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}