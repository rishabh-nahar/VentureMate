import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/button.global.dart';

class StartupInfoPage extends StatelessWidget {
  final void Function(int index) updateHomeRoutesIndex;
  const StartupInfoPage({super.key, required this.updateHomeRoutesIndex});

  @override
  Widget build(BuildContext context) {
      List<_startupData> startupData = [
        _startupData('Jan', 10000),
        _startupData('Feb', 15000),
        _startupData('Mar', 25000),
        _startupData('Apr', 65000),
        _startupData('May', 52000)
      ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            StartupNameDisplay(name: "Ola Cabs"),
            const SizedBox(height: 10,),
            totalInvestment(totalInvestmentAmount: 15000000),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Expanded(
                    child: Container(
                      child: StartupLocation(startupLocation: "Mumbai")
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: IndustryVertical(Industryvertical: "Ride")
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10,),
            InfoChart(data: startupData),
            const SizedBox(height: 10,),
            ContactDisplay(contact: 'info@olacab.com',),
            SizedBox(height: 10,),

            InkWell(
                child: ButtonGlobal(buttonVal: "Goback"),
                onTap: (){
                  updateHomeRoutesIndex(1);
              },  
            )
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
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w900,
          color: GlobalColors.primaryColor
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
          SizedBox(height: 5,),
            Text(
              "\u20B9 ${totalInvestmentAmount}",
              style: TextStyle(
                fontSize: 35,
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
          const Text("Location"),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Icon(Icons.location_on,),
             SizedBox(width: 10,),
             Text(
              startupLocation,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500

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
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          const Text("Industry Vertical"),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.business_center,),
              SizedBox(width: 10,),
              Text(
                Industryvertical,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}

class InfoChart extends StatelessWidget {
  List<_startupData> data;

  InfoChart({super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {

    return Container(
         child:SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Investment analysis'),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_startupData, String>>[
                LineSeries<_startupData, String>(
                    dataSource: data,
                    xValueMapper: (_startupData investment, _) => investment.year,
                    yValueMapper: (_startupData investment, _) => investment.investment,
                    name: 'Investment amount',
                    // Enable data label
                    // dataLabelSettings: DataLabelSettings(isVisible: true)
                    )
              ]),
    );
  }
}

class _startupData {
  _startupData(this.year, this.investment);

  final String year;
  final double investment;
}


class ContactDisplay extends StatelessWidget {
  String contact;
  ContactDisplay({super.key , required this.contact});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _openMail();
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
              Text('Contact Info'),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.alternate_email, size: 20,),
                  SizedBox(width: 5,),
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
  void _openMail() async {
    final Uri url = Uri.parse("mailto:smith@example.org?subject=News&body=New%20plugin");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }