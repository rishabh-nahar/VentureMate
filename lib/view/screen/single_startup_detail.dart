// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../widget/button.global.dart';

class StartupInfoPage extends StatefulWidget {
  final void Function(int index) updateHomeRoutesIndex;
  
  String startupName = "";
  String industryVertical = "";
  String location = "";
  double investment_in_USD = 0;

  StartupInfoPage({super.key, required this.updateHomeRoutesIndex, required  this.startupName, required  this.industryVertical, required  this.location, required this.investment_in_USD});

  @override
  State<StartupInfoPage> createState() => _StartupInfoPageState();
}

class _StartupInfoPageState extends State<StartupInfoPage> {
  String startupName = "";
  String startupLocation_ = "";
  double startupTotalInvestment_ = 0;
  String startupIndustryVertical = "";
  List<_startupData> startupData = [];
  List investorsData = [];
  List industrySubverticalData = [];

  @override
  void initState() {
    super.initState();
    setState(() {
        startupName = widget.startupName;
        startupLocation_ = widget.location;
        startupTotalInvestment_ = widget.investment_in_USD;
        startupIndustryVertical = widget.industryVertical;
        fetchStartupDetails();
    });
  }


Future<void> fetchStartupDetails() async {
    final url = Uri.parse(
        'http://fundinguru.pythonanywhere.com/dataguru/getStartup/?startup=${widget.startupName}');
    final response = await http.get(url);
    double totalInvestment = 0;
    List<_startupData> startupDataList = [
    ];

    if (response.statusCode == 200) {
      final data = json.decode(response.body.toString());
      for (var i = 0; i < data.length; i++) {
        print(" ${i} - ${data[i]} ");
        if(double.parse(data[i]['amount']) != 1){
          totalInvestment = totalInvestment + double.parse(data[i]['amount']);
          print(" -- ${totalInvestment}");
          startupDataList.add(
            _startupData("${data[i]['date']}", double.parse(data[i]['amount']))
          );
          investorsData.add(
            data[i]['investor'],
          );
          industrySubverticalData.add(
            data[i]['subvertical']
          );
        }
      }
      setState(() {
        startupData = startupDataList;
        startupTotalInvestment_ = totalInvestment;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                        widget.updateHomeRoutesIndex(1);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.white,
                        ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(child: StartupNameDisplay(name: capitalizeFirstLetter(startupName))),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  totalInvestment(totalInvestmentAmount: startupTotalInvestment_),
                  const SizedBox(height: 10,),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: IntrinsicHeight(child: StartupLocation(startupLocation: capitalizeFirstLetter(startupLocation_))),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: IntrinsicHeight(child: IndustryVertical(Industryvertical: capitalizeFirstLetter(startupIndustryVertical))),
                          ),
                        ],
                      ),
                    ),
                    
                  const SizedBox(height: 10,),
                  Container(child: industrySubvertical(industrySubvertical_: industrySubverticalData)),
                  const SizedBox(height: 10,),
                  Container(
                    child: investors(investors_: investorsData),
                  ),
                  InfoChart(data: startupData),
                  const SizedBox(height: 10,),
                  ContactDisplay(contact: 'support@${startupName.replaceAll(" ", "").toLowerCase()}.com',),
                  const SizedBox(height: 10,),
                ],
              ),
            ),

        ] ,
        ),
      )
    );
  }
}

class StartupNameDisplay extends StatelessWidget {
  String name;
  StartupNameDisplay({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        name,
        textAlign: TextAlign.right,
        style: const TextStyle(
          overflow: TextOverflow.visible,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }
}

class totalInvestment extends StatelessWidget {
  var totalInvestmentAmount;

  totalInvestment({super.key,required this.totalInvestmentAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              "Total investment",
              style: TextStyle(
                color: GlobalColors.darkThemeColor,
                fontSize: 15
              ),
            ),
          const SizedBox(height: 5,),
            Text(
              "\$ ${totalInvestmentAmount}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: GlobalColors.darkThemeColor
              ),
            )
          ],
        ),
      ),
    );
  }
}
class StartupLocation extends StatelessWidget {
  String startupLocation;
  StartupLocation({super.key ,required this.startupLocation});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, size: 18,) ,
              SizedBox(width: 5,),
              Text("Location"),
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const SizedBox(width: 10,),
             Flexible(
               child: Text(
                startupLocation,
                style: const TextStyle(
                  overflow: TextOverflow.clip,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
             
                ),
               ),
             )
           ],
          ),
        ],
      ),
    );
  }
}

class IndustryVertical extends StatelessWidget {
  String Industryvertical;
  IndustryVertical({super.key, required this.Industryvertical});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.business_center, size: 18,),
                SizedBox(width: 5,),
                Text("Industry Vertical"),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    Industryvertical,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}

class investors extends StatelessWidget {
  List investors_ = [];
  investors({super.key,required this.investors_});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              "Investors",
              style: TextStyle(
                color: GlobalColors.darkThemeColor,
                fontSize: 15
              ),
            ),
          const SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  "${ investors_.map((investor) => capitalizeFirstLetter(investor)).join(', ') }",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.darkThemeColor,
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class industrySubvertical extends StatelessWidget {
  List industrySubvertical_ = [];
  industrySubvertical({super.key,required this.industrySubvertical_});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              "Industry Subvertical",
              style: TextStyle(
                color: GlobalColors.darkThemeColor,
                fontSize: 15
              ),
            ),
          const SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                  "${ industrySubvertical_.map((subVertical) => capitalizeFirstLetter(subVertical)).join(', ') }",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.darkThemeColor,
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class InfoChart extends StatelessWidget {
  List<_startupData> data;

  InfoChart({super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {

    return Column(
         children:
         [  
            SizedBox(height: 20,),
            const Text(
              "Investment analysis",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            ),
            SfCircularChart(
              series: <CircularSeries<_startupData, String>>[
                PieSeries<_startupData, String>(
                    dataSource: data,
                    xValueMapper: (_startupData investment, _) => investment.date,
                    yValueMapper: (_startupData investment, _) => investment.investment,
                    name: 'Investment amount',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside
                    ), 
                ),
              ],
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                orientation: LegendItemOrientation.auto,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
            ),
         ]
    );
  }
}

class _startupData {
  _startupData(this.date, this.investment);

  final String date;
  final double investment;
}


class ContactDisplay extends StatelessWidget {
  String contact;
  ContactDisplay({super.key , required this.contact});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _sendEmail();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Column(
            children: [
              const Text('Contact Info'),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.alternate_email, size: 20,),
                  const SizedBox(width: 5,),
                  Text(
                    "${contact}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: GlobalColors.primaryColor
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
void _sendEmail() async {
  final Uri url = Uri.parse("mailto:smith@example.org?subject=News&body=New%20plugin");
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
String capitalizeFirstLetter(String str) {
  if (str == null || str.isEmpty) {
    return str;
  }
  return str.replaceRange(0, 1, str.substring(0, 1).toUpperCase());
}

