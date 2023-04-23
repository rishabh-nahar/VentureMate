import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/screen/home.view.dart';
import 'package:venturemate/view/screen/layout.view.dart';
import 'package:venturemate/view/signup.view.dart';
import 'package:venturemate/view/widget/button.global.dart';
import 'package:venturemate/view/widget/text.form.global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';



class OTPView extends StatefulWidget {


  @override
  _OTPViewState createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  
  // OTPView({Key? key}) : super(key: key);
  final TextEditingController otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var code = "";
  var otpMessage = "";

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
                         // ========== text container ========== //
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text('Verify OTP', 
                                style: TextStyle(
                                  color: GlobalColors.primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                )),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Enter the OTP",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                          ]   
                          // ==========  text container end ========== //
                        ),
                         const SizedBox(
                          height: 20,
                        ),
                        // ========== OTP box ==========
                        Text(
                          otpMessage,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PinCodeTextField(
                          appContext: context, 
                          length: 6, 
                          onChanged: (value){code = value;},
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                        ),
                        // ========== OTP box end==========
                        InkWell(
                            child: const ButtonGlobal(
                              buttonVal: "Verify OTP",
                            ),
                            onTap: () async{
                              try {
                                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: SignupView.verify, smsCode: code);
                                
                                // Sign the user in (or link) with the credential
                                await _auth.signInWithCredential(credential);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => LayoutView(isLoggedIn: true,))
                                );
                              } catch (e) {
                                setState((){
                                  otpMessage = "Invalid OTP";
                                });
                              }
                            },
                        ),
                         // ========== Image ========== //
                          Container(
                              alignment: Alignment.center,
                              child:Image.asset(
                                'assets/images/signin_signup/login_.png',
                              )
                          ),
                        
                        // ========== Image end ========== //
                      ]
                    )
                  )
                )

                // ========== Main body container end ========== //
                
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
            const Text("Want to edit phone number? ", style: TextStyle(fontSize: 17),),
            InkWell(
              child: Text(
                'Go back',
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
