import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:venturemate/view/screen/single_startup_detail.dart';
import 'package:venturemate/view/widget/button.global.dart';
import 'dart:convert';

import 'package:venturemate/view/widget/moderncard.global.dart';

// ignore: camel_case_types
class searchResultView extends StatefulWidget {
  final void Function(int index) updateHomeRoutesIndex;
  const searchResultView({super.key, required this.updateHomeRoutesIndex});
  @override
  State<searchResultView> createState() => searchResultViewState();
}

// ignore: camel_case_types
class searchResultViewState extends State<searchResultView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStartUpData();
  }
  List<MyCard> myCards = [
    MyCard(title: 'Ola Cab', subtitle: 'Rides', profit: false),
    MyCard(title: 'Flipkart', subtitle: 'E-commerce' ,profit: true),
    MyCard(title: 'Paytm', subtitle: 'Finance', profit: true),
    MyCard(title: 'Amazon', subtitle: 'Ecommerce', profit: true),
    MyCard(title: 'Kingfisher', subtitle: 'Medicine', profit: true),
    MyCard(title: 'Oyo', subtitle: 'Hotels', profit: true),
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
    
        children:[
          // Center(
          //   child: ElevatedButton(
          //     onPressed: (){
          //     fetchStartUpData(); 
          //     // widget.updateHomeRoutesIndex(0);
          //     }, 
          //     child: const Text("Fetch Data")
          //   ),
          // ),
        SizedBox(height: 20,),
          Column(
            children: myCards.map((card) {
              return  InkWell(
                onTap: (){
                  widget.updateHomeRoutesIndex(2);
                },
                child: ModernCard(
                    title: card.title,
                    subtitle: card.subtitle,
                    profit: card.profit,
                  ),
              );
            }).toList(),
          ),
          SizedBox(height: 20,),
            InkWell(
              child: ButtonGlobal(buttonVal: "Goback"),
              onTap: (){
                widget.updateHomeRoutesIndex(0);
            },  
          )
        ]
      ),
    );
  }
}
String baseUrl = "https://fundinguru.pythonanywhere.com/dataguru/getData"; // replace with your API URL

// void fetchStartUpData() async{
//     final dio = Dio(BaseOptions(
//       baseUrl: 'https://fundinguru.pythonanywhere.com',
//       connectTimeout: const Duration(seconds: 15),
//       receiveTimeout: const Duration(seconds: 5),
//     ));
    
//     // make the API call using the Dio instance
//     final response = await dio.get('/dataguru/getData');// fetch data for first 151 pokemon
//     List<dynamic> dataList = [];

//     if (response.statusCode == 200) {
//       print(response.data);
//       Map<String, dynamic> responseMap = response.data;
//       responseMap.forEach((key, value) {
//         dataList.addAll(value);
//       });
//       print(dataList);
//     }
//     else{
//       print("Error");
//     }
// }
void fetchStartUpData() async {
  final url = Uri.parse('https://fundinguru.pythonanywhere.com/dataguru/getData');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

class MyCard {
  String title;
  String subtitle;
  bool profit;
  MyCard({required this.title, required this.subtitle, required this.profit});
}