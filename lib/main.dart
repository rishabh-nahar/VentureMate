import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturemate/view/splash.view.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(ventureMate(isLoggedIn: isLoggedIn));
} 

// ignore: camel_case_types
class ventureMate extends StatelessWidget{
  final bool isLoggedIn;
  const ventureMate({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashView(isLoggedIn: isLoggedIn),
      // home: signup()
    );
  }
} 

