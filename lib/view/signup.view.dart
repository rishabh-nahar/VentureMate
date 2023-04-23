// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/otpScreen.view.dart';
import 'package:venturemate/view/screen/home.view.dart';
import 'package:venturemate/view/screen/layout.view.dart';
import 'package:venturemate/view/widget/button.global.dart';
import 'package:venturemate/view/widget/text.form.global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



import '../auth.dart';



class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);
  final TextEditingController phoneNumberController = TextEditingController();
  
  User? currentUser = FirebaseAuth.instance.currentUser;
  static String verify = '';
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignin = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: GlobalColors.primaryColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ========== logo container ========== //
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment:  Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 40,
                      ),
                      // Text('Venture Mate',
                      //     style: TextStyle(
                      //       color: GlobalColors.lightThemeColor,
                      //       fontSize: 35,
                      //       fontWeight: FontWeight.bold,
                      //       fontFamily: GoogleFonts.poppins().fontFamily,
                      //     )
                      // )
                    ],
                  )
                  ),

                // ========== Main body container ========== //
                
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ========== Login text container ========== //
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text("Let's get started", 
                                style: TextStyle(
                                  color: GlobalColors.primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                )),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Enter your phone number",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                          ]   
                        ),
                        // ========== Login text container end ========== //

                          // ========== Spacer
                          const SizedBox(
                            height: 15,
                          ),
                          // ========== spacer end
     
                          // ========== Mobile Input
                          TextFormGlobal(
                            key: UniqueKey(),
                            controller: phoneNumberController,
                            text: 'Mobile',
                            obscure: false,
                            textInputType: TextInputType.phone,
                          ),
                          // ========== Mobile Input end

                          // ========== Spacer
                          const SizedBox(
                            height: 15,
                          ),
                          // // ========== Spacer end

                          InkWell(
                            child: const ButtonGlobal(
                              buttonVal: "Sign In",
                            ),
                            onTap: () async{
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: '+91${phoneNumberController.text}',
                                verificationCompleted: (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {},
                                codeSent: (String verificationId, int? resendToken) {
                                  setLoggedIn(true);
                                  SignupView.verify = verificationId;
                                  navigator?.push(
                                    MaterialPageRoute(builder: (context) => OTPView()),
                                  );
                                },
                                codeAutoRetrievalTimeout: (String verificationId) {},
                              );
                              // FirebaseAuth.instance.createUserWithEmailAndPassword(
                              //   email: emailController.text.trim(),
                              //   password: passwordController.text.trim()
                              // ).then((value) => {
                              //   // createUser()
                              //   setLoggedIn(true),
                              //   print(value)
                              // });
                            },
                          ),
                          // ==========Submit button end

                          // ========== Spacer
                          const SizedBox(
                            height: 15,
                          ),
                          // // ========== Spacer end

                          const Center(
                            child: Text("OR",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                          
                          // ========== Spacer
                          const SizedBox(
                            height: 15,
                          ),
                          // // ========== Spacer end
                          // ========== Sign in with Google button
                          Container(
                            // color: Colors.white,
                            height: 55,
                            decoration : BoxDecoration(
                              border: Border.all(
                                color: GlobalColors.darkThemeColor,
                                width: 0.5
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white
                            ),
                            child: MaterialButton(
                              onPressed: () async{  
                               try {
                          
                                    final GoogleSignInAccount? googleSignInAccount =
                                    await _googleSignin.signIn();
                                    if (googleSignInAccount != null) {
                                      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
                                      final AuthCredential authCredential = GoogleAuthProvider.credential(
                                        accessToken: googleSignInAuthentication.accessToken,
                                        idToken: googleSignInAuthentication.idToken,
                                      );
                                      print(googleSignInAccount.email);
                                      await _auth.signInWithCredential(authCredential);
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                        context, 
                                        MaterialPageRoute(builder: (context) => LayoutView(isLoggedIn: true,))
                                      );
                                    }
                                  } on FirebaseAuthException catch (error) {
                                    print(error.message);
                                  }
                              },                               
                              child: Center(
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/icons/google.png",
                                      height: 30,
                                    ),
                                    Center(
                                      child: 
                                        Text(
                                          "Sign in with Google",
                                          style: TextStyle(
                                            color: GlobalColors.darkThemeColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                        ),
                                      )
                                    )
                                    
                                  ],
                                 )
                              ),                           
                            ),
                          ),
                          // ========== Sign in with Google button end

                          // ========== Inputs end========== //

                        // ========== Image ========== //
                          Container(
                              alignment: Alignment.center,
                              child:Image.asset(
                                'assets/images/signin_signup/login_.png',
                              )
                          ),
                        
                        // ========== Image end ========== //

                      ]
                  
                    ),
                  ),
                )
      

                    ],
                  ),
          )
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 50,
      //   alignment: Alignment.center,
      //   color: GlobalColors.lightThemeColor,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text("Already have an account? ", style: TextStyle(fontSize: 17),),
      //       InkWell(
      //         child: Text(
      //           'Log in',
      //           style: TextStyle(
      //             color: GlobalColors.primaryColor,
      //             fontSize: 17,
      //             fontWeight: FontWeight.w500
      //           ),
      //         ),
      //         onTap : () {
      //           Get.to(OTPView());
      //         }
      //       )
      //     ],
      //   ),
      // ),
    );
  
  }
  
  // Future createUser() async{
  //   try {
  //     final docUser = FirebaseFirestore.instance.collection('users').doc();
  //     final userData = {
  //       'userId': currentUser!.uid,
  //       'firstname': firstnameController.text,
  //       'lastname': lastnameController.text,
  //       'email': emailController.text,
  //       'mobile':phoneNumberController.text,
  //       'password' :passwordController.text,
  //       'timestamp': DateTime.now()
  //     };
  //     await docUser.set(userData);
  //   } catch (e) {
  //         print('An error occurred: $e');
  //   }
  // }
  
// Set a boolean value in shared preferences
Future<void> setLoggedIn(bool value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', value);
  print("Runnign shared prefs");
}

}

