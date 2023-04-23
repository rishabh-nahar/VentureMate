import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/otpScreen.view.dart';
import 'package:venturemate/view/screen/home.view.dart';
import 'package:venturemate/view/signup.view.dart';
import 'package:venturemate/view/widget/button.global.dart';
import 'package:venturemate/view/widget/text.form.global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';



class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
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
                                "Welcome back! glad to see you again",
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
                          InkWell(
                            child: const ButtonGlobal(
                              buttonVal: "Login",
                            ),
                            onTap:(() {  
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => MyHomePage())
                            );
                            }) 
                          ),
                          // ==========Submit button end

                          const SizedBox(
                            height: 15,
                          ),
                          // ========== Spacer end
                          // ==========Submit button
                          MaterialButton(
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
                                    await _auth.signInWithCredential(authCredential);
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(builder: (context) => MyHomePage())
                                    );
                                  }
                                } on FirebaseAuthException catch (error) {
                                  // ignore: avoid_print
                                  print(error.message);
                                }
                            }, 
                            color: GlobalColors.primaryColor,
                            height: 50,

                            child: Center(
                               child:  Text(
                                "Sign in with Google",
                                style: TextStyle(
                                  color: GlobalColors.lightThemeColor,
                                  fontSize: 18
                                ),
                               )
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
            const Text("Don't have account?", style: TextStyle(fontSize: 17),),
            InkWell(
              child: Text(
                ' Sign up',
                style: TextStyle(
                  color: GlobalColors.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500

                ),
              ),
              onTap : () {
                Get.to(SignupView());
              }
            )
          ],
        ),
      ),
    );
  
  }
}
