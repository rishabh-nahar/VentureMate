import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        updateHomeRoutesIndex(1);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.white,
                        ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  StartupNameDisplay(name: "Ola Cabs"),
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
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: IndustryVertical(Industryvertical: "Transportation")
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  InfoChart(data: startupData),
                  const SizedBox(height: 10,),
                  ContactDisplay(contact: 'info@olacab.com',),
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
        textAlign: TextAlign.left,
        style: const TextStyle(
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
              "\u20B9 ${totalInvestmentAmount}",
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
      constraints: BoxConstraints(
        maxHeight: double.infinity
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, size: 18,) ,
              const SizedBox(width: 5,),
              const Text("Location"),
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
              children: [
                const Icon(Icons.business_center, size: 18,),
                const SizedBox(width: 5,),
                const Text("Industry Vertical"),
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