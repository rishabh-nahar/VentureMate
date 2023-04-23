import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/screen/profile.view.dart';
import 'package:venturemate/view/splash.view.dart';
import 'package:venturemate/view/widget/dropdown.global.dart';
import 'package:venturemate/view/widget/text.form.global.dart';


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController locationController = TextEditingController();
  String locationSelectedValue = 'Agra';
  List<String> locations = ['Agra','Ahemadabad','Ahemdabad','Ahmedabad','Amritsar','Andheri','Bangalore','Bangalore / Palo Alto','Bangalore / SFO','Bangalore / San Mateo','Bangalore / USA','Bangalore/ Bangkok','Belgaum','Bengaluru','Bengaluru and Gurugram','Bhopal','Bhubaneswar','Bhubneswar','Boston','Burnsville','California','Chandigarh','Chembur','Chennai','Chennai/ Singapore','Coimbatore','Dallas / Hyderabad','Delhi','Delhi & Cambridge','Faridabad','Gaya','Goa','Goa/Hyderabad','Gurgaon','Gurgaon / SFO','Gurugram','Gwalior','Haryana','Hubli','Hyderabad','Hyderabad/USA','India','India / US','India/Singapore','India/US','Indore','Jaipur','Jodhpur','Kanpur','Karnataka','Karur','Kerala','Kochi','Kolkata','Kolkatta','Kormangala','Kozhikode','London','Lucknow','Menlo Park','Missourie','Mumbai','Mumbai / Global','Mumbai / NY','Mumbai / UK','Mumbai/Bengaluru','Nagpur','Nairobi','New Delhi','New Delhi / California','New Delhi / US','New Delhi/ Houston','New York','New York,','New York/ India','Noida','Noida / Singapore','Nw Delhi','Palo Alto','Panaji','Pune','Pune / Dubai','Pune / Singapore','Pune / US','Pune/Seattle','Rourkela','SFO / Bangalore','San Francisco','San Jose','Santa Monica','Seattle / Bangalore','Siliguri','Singapore','Srinagar','Surat','Taramani','Trivandrum','Tulangan','US/India','USA/India','Udaipur','Udupi','Uttar Pradesh','Vadodara','Varanasi'];
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                DropdownGlobal(selectedValue: locationSelectedValue , options: locations)
            ],
        ),
      ),
    );
  } 
}
