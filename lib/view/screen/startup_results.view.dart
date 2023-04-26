import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/screen/single_startup_detail.dart';
import 'dart:convert';

import 'package:venturemate/view/widget/moderncard.global.dart';
import 'package:venturemate/view/widget/screenLoader.dart';

  List<MyCard> myCards = [
    // MyCard(title: 'Ola Cab', subtitle: 'Rides', profit: false),
    // MyCard(title: 'Flipkart', subtitle: 'E-commerce' ,profit: true),
    // MyCard(title: 'Paytm', subtitle: 'Finance', profit: true),
    // MyCard(title: 'Amazon', subtitle: 'Ecommerce', profit: true),
    // MyCard(title: 'Kingfisher', subtitle: 'Medicine', profit: true),
    // MyCard(title: 'Oyo', subtitle: 'Hotels', profit: true),
  ];
// ignore: camel_case_types
class searchResultView extends StatefulWidget {
  final void Function(int index) updateHomeRoutesIndex;
  final void Function(int index, String startupName) updateHomeRoutesIndexForSingleStartupPage;
  
  String fundingType; 
  String indVertical;
  String location;

  searchResultView({super.key, 
            required this.updateHomeRoutesIndex, 
            required this.location,
            required this.indVertical, 
            required this.fundingType, 
            required this.updateHomeRoutesIndexForSingleStartupPage
    });
  @override
  State<searchResultView> createState() => searchResultViewState();
}

// ignore: camel_case_types
class searchResultViewState extends State<searchResultView> {
  List<MyCard> myCards = [];

  void fetchData(indVertical, location, fundingType) async {;
    final data = await fetchStartUpData(indVertical, location,fundingType); // function that returns Future<List<MyCard>>
    setState(() {
      myCards = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData(widget.indVertical, widget.location, widget.fundingType);
  }
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child:
        Container(
          color: GlobalColors.primaryColor,
          child: Column(
            children:[
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: InkWell(
                            onTap: (){
                              widget.updateHomeRoutesIndex(0);
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.white,
                              ),
                          ),
                        ),
                        Container(
                          child: const Text(
                            "Search Results",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.white
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: 
                   myCards.length == 0?
                    Column(
                      children: [
                          LoaderAnimation(),
                        ]
                    ):
                  Column(  
                    children: [
                      const SizedBox(height: 20,),
                        Column(
                          children: myCards.map((card) {
                            return  InkWell(
                              onTap: (){
                                widget.updateHomeRoutesIndexForSingleStartupPage(2 , card.title);
                              },
                              child: ModernCard(
                                  title: card.title,
                                  subtitle: card.subtitle,
                                  profit: card.profit,
                                ),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                )
                ]
          ),
        ),
      
    );
  }
}

Future<List<MyCard>> fetchStartUpData(industryVertical, city, fundingType) async {


  final url = Uri.parse('https://fundinguru.pythonanywhere.com/dataguru/getData/?industryVertical=E-Commerce&city=Mumbai&ventureType=Series%20G');
  // final url = Uri.parse('https://fundinguru.pythonanywhere.com/dataguru/getData/?industryVertical=${industryVertical}&city=${city}&ventureType=${fundingType}');
  print(url);
  final response = await http.get(url);
  List<MyCard> myCards  = [];
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    for (var i = 0; i < data.length; i++) {
      bool isInProfit = false;
      print(data[i]);
      if (data[i]['outcome']== 'Profit') {
          isInProfit = true;
      }
        myCards.add(
          MyCard(title: data[i]['startup_name'], subtitle: data[i]['industry_subvertical'], profit:isInProfit)
        );
    }
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  
  return myCards;
}

class MyCard {
  String title;
  String subtitle;
  bool profit;
  MyCard({required this.title, required this.subtitle, required this.profit});
}