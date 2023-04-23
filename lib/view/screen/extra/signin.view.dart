// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/screen/extra/login.view.dart';
import 'package:venturemate/view/otpScreen.view.dart';
import 'package:venturemate/view/widget/button.global.dart';
import 'package:venturemate/view/widget/text.form.global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';



class OldSignupView extends StatelessWidget {
  OldSignupView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  
  User? currentUser = FirebaseAuth.instance.currentUser;
  static String verify = '';

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
                  child: Text('Venture Mate',
                      style: TextStyle(
                        color: GlobalColors.lightThemeColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      )
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
                                "Create an account to continue.",
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
                        // ========== Inputs ========== //

                          // ========== firstname Input
                          TextFormGlobal(
                            key: UniqueKey(),
                            controller: firstnameController,
                            text: 'Firstname',
                            obscure: false,
                            textInputType: TextInputType.text,
                          ),
                          // ========== firstname Input end

                          // ========== Spacer
                          const SizedBox(
                            height: 15,
                          ),
                          // ========== Spacer end

                          // ========== lastname Input
                          TextFormGlobal(
                            key: UniqueKey(),
                            controller: lastnameController,
                            text: 'Lastname',
                            obscure: false,
                            textInputType: TextInputType.text,
                          ),
                          // ========== lastname Input end

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
                            textInputType: TextInputType.number,
                          ),
                          // ========== Mobile Input end

                          // ========== Spacer
                          const SizedBox(
                            height: 15,
                          ),
                          // ========== Spacer end

                          // ========== Email Input
                          TextFormGlobal(
                            key: UniqueKey(),
                            controller: emailController,
                            text: 'Email',
                            obscure: false,
                            textInputType: TextInputType.emailAddress,

                          ),
                          // ========== Email Input end

                          // ========== Spacer
                          const SizedBox(
                            height: 15,
                          ),
                          // ========== Spacer end

                          // ========== Password Input
                          TextFormGlobal(
                              key: UniqueKey(),
                              controller: passwordController,
                              text: 'Password',
                              obscure: true,
                              textInputType: TextInputType.text,
                          ),
                            // ========== Password Input end
                          // ========== Spacer
                          const SizedBox(
                            height: 15,
                          ),

                          // ========== Forget Password end
                          // ========== Spacer
                            const SizedBox(
                            height: 15,
                          ),
                          // ========== Spacer end
                          // ==========Submit button
                            InkWell(
                              child: const ButtonGlobal(
                                buttonVal: "Sign Up",
                              ),
                              onTap: () async{
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: '+91${phoneNumberController.text}',
                                  verificationCompleted: (PhoneAuthCredential credential) {},
                                  verificationFailed: (FirebaseAuthException e) {},
                                  codeSent: (String verificationId, int? resendToken) {
                                    SignupView.verify = verificationId;
                                    navigator?.push(
                                      MaterialPageRoute(builder: (context) => OTPView()),
                                    );
                                  },
                                  codeAutoRetrievalTimeout: (String verificationId) {},
                                );
                                FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim()
                                ).then((value) => {
                                  // createUser()
                                  print(value)
                                });
                              },
                            ),
                          // ==========Submit button end

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
      bottomNavigationBar: Container(
        height: 50,
        alignment: Alignment.center,
        color: GlobalColors.lightThemeColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account? ", style: TextStyle(fontSize: 17),),
            InkWell(
              child: Text(
                'Log in',
                style: TextStyle(
                  color: GlobalColors.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),
              ),
              onTap : () {
                Get.to(OTPView());
              }
            )
          ],
        ),
      ),
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
}
