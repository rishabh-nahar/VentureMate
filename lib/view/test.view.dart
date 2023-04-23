import 'package:flutter/material.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/screen/extra/login.view.dart';
import 'package:venturemate/view/widget/button.global.dart';
import 'package:venturemate/view/widget/text.form.global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth.dart';

class testsignupView extends StatefulWidget {
  testsignupView({super.key});

  @override
  State<testsignupView> createState() => _signupViewState();
}

class _signupViewState extends State<testsignupView> {
  String errorMessage = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  // final Auth _auth = Auth();

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
                  color: GlobalColors.primaryColor,
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
                              Text('Login', 
                                style: TextStyle(
                                  color: GlobalColors.primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                )),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Welcome back! heyy",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                errorMessage,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                          ]   
                        ),

                        // ========== Login text container end ========== //
                        // ========== Inputs ========== //

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
                          // ========== Spacer end
                          // ========== Forget Password
                          // Container(
                          //   alignment: Alignment.centerRight,
                          //   child:const Text("Forget password?"),
                          // ),
                          // ========== Forget Password end
                          // ========== Spacer
                            const SizedBox(
                            height: 15,
                          ),
                          // ========== Spacer end
                          // ==========Submit button
                          GestureDetector(
                            onTap: () async {
                                // ignore: avoid_print
                                try {
                                  await Auth().signup(
                                      emailController.text.trim(),
                                      passwordController.text.trim());
                                      setState(() {
                                        errorMessage = "Sucess";
                                      });
                                  }
                                  
                                on FirebaseException catch (e) {
                                  // ignore: avoid_print
                                  print(e.message);
                                  setState(() {
                                    errorMessage = "${e.message}";
                                  });
                                }
                            },
                            child: const ButtonGlobal(
                                buttonVal: "Signup",
                              ),
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
            Text("Don't have account?", style: TextStyle(fontSize: 17),),
            InkWell(
              child: Text(
                'Login',
                style: TextStyle(
                  color: GlobalColors.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500

                ),
              ),
              onTap : () {
                Get.to((){LoginView();});
              }
            )
          ],
        ),
      ),
    );
  
  }
}