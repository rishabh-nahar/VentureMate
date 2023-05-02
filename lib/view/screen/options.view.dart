import 'package:flutter/material.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/widget/button.global.dart';
import '../widget/autocompleteinput.form.global.dart';

class FilterOptionsView extends StatefulWidget {
  final Function(int index, List<String>data) updateHomeRoutesIndexWithData;

  const FilterOptionsView({Key? key, required this.updateHomeRoutesIndexWithData})
      : super(key: key);

  @override
  State<FilterOptionsView> createState() => _FilterOptionsViewState();
}

class _FilterOptionsViewState extends State<FilterOptionsView> {
  List<String> locations = ['bengaluru', 'gurgaon', 'new delhi', 'mumbai', 'chennai', 'pune', 'noida', 'faridabad', 'san francisco', 'san jose,', 'amritsar', 'delhi', 'kormangala', 'hyderabad', 'burnsville', 'menlo park', 'gurugram', 'palo alto', 'santa monica', 'singapore', 'taramani', 'andheri', 'chembur', 'haryana', 'new york', 'karnataka', 'mumbai/bengaluru', 'bhopal', 'bengaluru and gurugram', 'india/singapore', 'jaipur', 'india/us', 'nagpur', 'indore', 'new york, bengaluru', 'california', 'india', 'rourkela', 'srinagar', 'bhubneswar', 'chandigarh', 'delhi & cambridge','kolkatta', 'kolkata', 'coimbatore', 'bangalore', 'udaipur', 'ahemdabad', 'bhubaneswar', 'ahmedabad', 'ahemadabad', 'surat', 'goa', 'uttar pradesh', 'nw delhi', 'gaya', 'vadodara', 'trivandrum', 'missourie', 'panaji', 'gwalior', 'karur', 'udupi', 'kochi', 'agra', 'bangalore/ bangkok', 'hubli', 'kerala', 'kozhikode', 'usa', 'siliguri', 'lucknow', 'kanpur', 'sfo/bangalore', 'london', 'seattle/bangalore', 'pune/seattle', 'pune/dubai', 'bangalore/sfo', 'varanasi', 'new delhi/us', 'mumbai/uk','jodhpur'];  
  List<String> indVertical = ['ed tech', 'transport', 'e commerce', 'fin tech', 'fashion and apparel', 'logistics', 'hospitality', 'tech', 'aerospace', 'b2b focused foodtech startup', 'video', 'gaming', 'software', 'health and wellness', 'education', 'food & beverage', 'b2b marketing', 'video games', 'saas', 'last mile transport', 'health care', 'customer service', 'b2b', 'consumer goods', 'advertising, marketing', 'iot', 'it', 'consumer tech', 'accounting', 'finance', 'customer service platform', 'automotive', 'services', 'compliance', 'artificial intelligence', 'luxury label', 'waste management service', 'deep tech', 'energy', 'digital media', 'automobile', 'agtech', 'social media', 'ai', 'nanotech', 'services platform', 'travel tech', 'online education', 'online marketplace', 'saas, e commerce', 'nbfc', 'food', 'food tech', 'automation', 'investment', 'social network', 'fashion', 'real estate', 'logistics tech', 'consumer internet', 'b2b platform', 'clean tech', 'media', 'publishing', 'agriculture', 'inspiration', 'storytelling', 'lifestyle', 'consumer portal', 'others', 'fmcg', 'reality','auto','bfsi'];
  List<String> investmentType = ['private', 'series c', 'series b', 'pre series a', 'seed', 'series a', 'series d', 'series f', 'series e', 'series g', 'series h', 'venture', 'debt', 'funding', 'corporate', 'maiden', 
'single venture', 'angel', 'series j', 'venture   series unknown', 'bridge', 'debt and preference capital', 'inhouse', 'equity', 'mezzanine', 'series b (extension)', 'structured debt','termloan'];


  TextEditingController locationController = TextEditingController();
  TextEditingController industryVerticalController = TextEditingController();
  TextEditingController fundingTypeController = TextEditingController();

  static String formTitle = "Search";
  static Color formTitleColor = GlobalColors.darkThemeColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: GlobalColors.primaryColor,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: GlobalColors.primaryColor,
                child: const Text(
                  "Target your search",
                  textAlign: TextAlign.center,
                  style: TextStyle( 
                      fontSize: 30, 
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      ),
                    ),
                ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      formTitle,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: formTitleColor
                      ),
                    ),
                      const SizedBox(
                      height: 20,
                    ),
                    MyAutocompleteTextField(
                      textEditingController: locationController,
                      suggestions: locations,
                      placeholder: "Locations",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyAutocompleteTextField(
                      textEditingController: industryVerticalController,
                      suggestions: indVertical,
                      placeholder: "Industry vertical",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyAutocompleteTextField(
                      suggestions: investmentType,
                      placeholder: "Funding Type",
                      textEditingController: fundingTypeController ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                          color: GlobalColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: GlobalColors.darkThemeColor.withOpacity(0.1),
                              blurRadius: 10,
                            )
                          ]),
                      child: InkWell(
                        onTap: () async {
                          List<String> data = [ locationController.text, industryVerticalController.text, fundingTypeController.text ];
                          try {
                              if (locationController.text.isNotEmpty &&
                                  industryVerticalController.text.isNotEmpty &&
                                  fundingTypeController.text.isNotEmpty) {
                                  widget.updateHomeRoutesIndexWithData(
                                    1,
                                    <String>[
                                      locationController.text,
                                      industryVerticalController.text,
                                      fundingTypeController.text
                                  ],
                                );
                              }

                              else{
                                print("Error");
                                setState(() {
                                  formTitle = "Please fill all details to proceed";
                                  formTitleColor = Colors.red;
                                });
                              }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child:const ButtonGlobal(buttonVal: "Search"),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(
                        "assets/images/image-bank/Saving_money.gif",
                        height: 200,
                      ),
                    ),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
