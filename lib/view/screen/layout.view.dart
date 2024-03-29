import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/screen/home.view.dart';
import 'package:venturemate/view/screen/profile.view.dart';
import 'package:venturemate/view/signup.view.dart';


class LayoutView extends StatefulWidget {
  var isLoggedIn = false;
  
  LayoutView({Key? key, required this.isLoggedIn }) : super(key: key);
  @override

  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  
  bool isLoggedIn = false;
  int currentIndex = 0;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    isLoggedIn = widget.isLoggedIn;
  }

  final tabs = [
    MyHomePage(homeRoutesIndex: 0),
    // ProfileView(),
    const Center(child: Text("Sign out")),
  ];
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 35,
            ),
            // Text('Venture Mate',
            //     style: TextStyle(
            //       color: GlobalColors.lightThemeColor,
            //       fontSize: 35,
            //       fontWeight: FontWeight.bold,
            //       // fontFamily: GoogleFonts.poppins().fontFamily,
            //     )
            // )
          ],
        ),
      ),
      body: Container(
        child: tabs[currentIndex]
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        currentIndex: currentIndex,
        selectedItemColor: GlobalColors.primaryColor,
        unselectedItemColor: GlobalColors.darkThemeColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search_rounded),
          //   label: 'Explore'
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.account_circle_rounded),
          //   label: 'Profile'
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout ),
            label: 'Sign out',
          )
        ],
        onTap: (index) async{ 
           if (index == 1) {
              // Perform sign-out operation here
              // For example, clear user credentials or navigate to the sign-in screen
                await _googleSignIn.signOut();
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('isLoggedIn');
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupView())
                );
            } else {
              setState(() {
                currentIndex = index;
              });
            }
        },
       )
    );
  }
}

