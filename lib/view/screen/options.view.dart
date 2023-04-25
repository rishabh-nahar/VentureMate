import 'package:flutter/material.dart';
import 'package:venturemate/utlis/global.color.dart';
import 'package:venturemate/view/screen/home.view.dart';
import 'package:venturemate/view/screen/layout.view.dart';
import 'package:venturemate/view/screen/startup_results.view.dart';
import '../widget/autocompleteinput.form.global.dart';
import 'package:dio/dio.dart';

class FilterOptionsView extends StatefulWidget {
  final void Function(int index) updateHomeRoutesIndex;

  const FilterOptionsView({Key? key, required this.updateHomeRoutesIndex})
      : super(key: key);

  @override
  State<FilterOptionsView> createState() => _FilterOptionsViewState();
}

class _FilterOptionsViewState extends State<FilterOptionsView> {
  List<String> locations = ['Agra','Ahemadabad','Ahemdabad','Ahmedabad','Amritsar','Andheri','Bangalore','Bangalore / Palo Alto','Bangalore / SFO','Bangalore / San Mateo','Bangalore / USA','Bangalore/ Bangkok','Belgaum','Bengaluru','Bengaluru and Gurugram','Bhopal','Bhubaneswar','Bhubneswar','Boston','Burnsville','California','Chandigarh','Chembur','Chennai','Chennai/ Singapore','Coimbatore','Dallas / Hyderabad','Delhi','Delhi & Cambridge','Faridabad','Gaya','Goa','Goa/Hyderabad','Gurgaon','Gurgaon / SFO','Gurugram','Gwalior','Haryana','Hubli','Hyderabad','Hyderabad/USA','India','India / US','India/Singapore','India/US','Indore','Jaipur','Jodhpur','Kanpur','Karnataka','Karur','Kerala','Kochi','Kolkata','Kolkatta','Kormangala','Kozhikode','London','Lucknow','Menlo Park','Missourie','Mumbai','Mumbai / Global','Mumbai / NY','Mumbai / UK','Mumbai/Bengaluru','Nagpur','Nairobi','New Delhi','New Delhi / California','New Delhi / US','New Delhi/ Houston','New York','New York,','New York/ India','Noida','Noida / Singapore','Nw Delhi','Palo Alto','Panaji','Pune','Pune / Dubai','Pune / Singapore','Pune / US','Pune/Seattle','Rourkela','SFO / Bangalore','San Francisco','San Jose','Santa Monica','Seattle / Bangalore','Siliguri','Singapore','Srinagar','Surat','Taramani','Trivandrum','Tulangan','US/India','USA/India','Udaipur','Udupi','Uttar Pradesh','Vadodara','Varanasi'];
  
  List<String> indVertical = ['mutual fund investing platform','waste management solutions','online grocery platform','hyper local logistics platform','reward points mobile app','two-wheeler taxi service','digital signal processing platform','skill training & placement platform','casual dating app','online food ordering & delivery service','hyperlocal online home services provider','consumer portal','online marketplace','online user engagement platform','edtech','b2b mobile auction marketplace','us ticketing and fleet management platform','nanotechnology','virtual reality headset creator','bike, renting marketplace','language learning app','online art marketplace','micro-brewery','ecommerce returns etailer','digital coupons, & cashback aggregator app','budget accommodation platform','machine learning platform','it','performance optimization platform for athletes','online rti application services','on-demand logistics service','home cooked food marketplace & delivery','b2b ecommerce marketplace','career community for women','nightlife discovery mobile app','online curated holiday package bookings','restaurant reservation app','home improvement service platform','online budget hotel chain','e-commerce','mobile point of sale payment solution','digital media','beauty & wellness mobile app','mobile health tech','solar power solutions company','automotive services platform','energy & environment online marketplace','online and tv shopping marketplace','technology','music streaming app','mobile app based loan disbursement platform','online food ordering & delivery','customer engagement platform','virtual reality, simulation and stereoscopic products','end-to-end logistics platform','online interior designing platform','crowdsourced delivery platform','cloud enterprise software','online health & wellness platform','self driven rental car platform','cloud based hotel sales platform','engineering services company','saas','automobile','micro finance platform','tech','consumer goods','online tailoring services','used gadgets buy / refurbishing','real estate intelligence platform','online income tax filing platform','sustainable agri-inputs firm','clud based learning platform','startup analytics platform','education content etailer','online ed-tech platform','non profit organization to alleviate poverty','health-tech platform','iot','others','employee onboarding & orientation platform','home stay & room rentals platform','fine dining restaurant chain','ecommerce platform solutions','health and beauty services marketplace','wedding venues & vendors marketplace','industrial toons marketplace','hyper-local online/mobile grocery','spa & salon management software','storytelling','interface development platform for government officials','workforce management software','cab sharing service mobile app','app analytics platform','deep-tech','peer to peer lending platform','accounting','automotive','api workflow platform','big data management platform','on demand beauty services platform','hyperlocal electronics repair service','doctors network mobile app','online marketplace for industrial goods','mobile payments app','talent platform for fashion professionals','fintech startup incubation platform','mobile fitness app','interactive educational games','online printing marketplace','home medical care services','big data & analytics services','on-demand washing & dry-cleaning','bike rental platform','online lingerie platform','ecommerce website creation saas platform','mobile compression software','tech platform for property brokers','truck aggregator & logistics service','home services marketplace','online classifieds','online identity verification services platform','mobile laundry cleaning service','gaming','pre-used luxury item marketplace','budget hotel accommodation brand','residential rental management platform','digital marketing automation solution','mobile only shopping assistant','visual blogging platform','on-demand app based professional service provider','mobile accessories online store','fund raising platform for startups','online learning platform','personalized stock intelligence platform','logistics intelligence','food and beverages','innovative water solutions','online taxi rental platform','luxury apparel rental','real estate advisory','fintech','budget hotel accommodation','order fulfillment saas platform','study material marketplace','car & bike ecommerce platform','custom made furniture e-tailer','online education marketplace','online payment gateway','payment solutions platform','used two-wheeler marketplace','video games','online education','online school for analytics learning','online p2p lending marketplace','app based bus pooling services','online travel marketplace','electric scooter manufacturer','online hiring platform','event ticketing platform','holiday resort chain','express local delivery platform','professional service appointment booking service','parents focused web content','on-demand beauty services','quick service restaurant & online delivery','healthcare','online finance lending platform','video advertisement platform','home cooked food order & delivery platform','ride sharing platform','bfsi','private jet/ helicopter marketplace','product discovery & comparison app','citizens engagement platform','ethnic product ecommerce','off-grid solar power','nonbanking finance company','home fitting & fixtures marketplace','railways information mobile app','wedding planning platform','online city & lifestyle guide','logistics tech','small business financing (nbfc)','clean tech','food discovery app','character merchandize sales platform','b2b-focused foodtech startup','social learning platform','b2b platform','modular furnishings marketplace','digital & physical publishing platform','reality','scientific horoscope online assistance platform','ecommece','online food ordering','waste management service','consumer internet','education marketplace','digital marketing services','budget accommodation aggregator','architectural design & consulting','mobile based pos solution','professional services marketplace','tech recruitment platform','on-demand home beauty and wellness portal','on-demand delivery logistics','prepaid mobile bill manager app','healthcare services discovery platform','industrial supplies b2b ecommerce','self driven car rental','online grocers','on-demand maids service provider','sports education platform','financial inclusion platform','fund raising platform','mobile-only tasks marketplace','fast food chain franchisee','last minute hotel booking app','ethnic/ traditional fashion store','private label apparel sales','indian ethnic crafts etailer','advertising & marketing community networking platform','psychometric test online software','enterprise marketing automation platform','professional health services platform','big data analytics platform','online fashion video portal','personalized wish list creator app','online education information platform','last mile transportation','brain games platform','online food ordering & delivery platform','flat rental mobile app','diagnostic labs aggregator platform','on-demand local logistics provider','mobile fitness marketplace','hotel booking app','designer merchandize marketplace','wealth management platform','real estate focused tech platform','public commute helper app','performance based wholesale marketplace','car aggregator & retail mobile app','online bus & cab ticketing platform','mobile marketing automation platform','on-demand delivery service','healthy meals food delivery platform','fin-tech','e-commerce & m-commerce platform','mobile application developer','doctor consultancy mobile app','premium dining lounges & restaurants','movie-on-demand platform','real estate mobile crm','data center software platform','women lifestyle marketplace','indoor navigation & analytics solutions','cloud-based hotel booking platform','crowd funding platform','mobile commerce platform','clean-tech','online tiffin service aggregator','affordable hotel booking online','business it intelligence services','hyperlocal deals marketplace','affordable personal healthcare products','rooftop solar plants','fmcg','tech enabled ac bus service','restaurant discount app','robotic program learning','ready to cook packaged foods','beauty services mobile marketplace','online food delivery','user engagment & analytics platform','ecommerce marketplace','early cancer detection solutions','mobile commerce for farmers','real-time stock data platform','online branded furniture etailer','fashion search & review platform','trucking logistic operations','fitness tracking management solutions','business intelligence & analytics','auto rickshaw based services','energy saving solutions provider','cross-channel crm platform','selfie mobile app','usiness expense management','food logistics & delivery','online loans marketplace','on demand cleaning & fixing services','online furniture, appliances rental platform','sports management & physical education business','qsr & online delivery portal','ecommerce logistics provider','online printing services','pre-owned luxury online apparel seller','p2p pre-owned goods marketplace','engineering innovations','b2b','fitness marketplace','retail','online education platform','online content platform for women','online pharmacy','qsr restaurant chain','online car rental affiliates','logistics services provider','on demand laundry services app','online purchase rewards app','lifestyle','online / mobile customer support','online freight services aggregator','hyperlocal handyman services','hyperlocal healthcare product delivery service provider','mobile game development & design platform','logistics tech platform','spam call block app','home made food marketplace','hyperlocal logistics service provider','restaurant management platform','automation','startup focused online publisher','branded food products online sales','fashion discovery platform','online pharmacy & drug db','stock market portal','financial products lead generation platform','online marketplace for chef meals','virtual reality activity based learning platform','hyperlocal online services platform','online meat ordering platform','picture creation & social mobile app','self-storage spaces','online gourmet food marketplace','online wedding marketplace','ecommerce platform','womens fashion wear portal','on-demand handyman services','conversational commerce mobile app','hyper-local grocery delivery platform','hyperlocal delivery services','b2b merchandize platform','hyperlocal delivery platform','business messaging app','payments solution provider','data driven recruitment recommendation','logistics service provider marketplace','f&b sector mobile payment platform','auto rickshaw based logistics','mobile messaging assistant app','efficient energy management platform','splitting bills mobile app','advertising,','mobile point of sale solutions','health & fitness app','on demand mobile app developer','online product comparison','tele-shopping / ecommerce','exam preparation platform','pre-used apparel shopping mobile app','online fashion aggregator','deep learning cloud algorithms','home furnishing solutions','online reputation management platform','smart report cards for schools','cloud data integration platform','food discovery & delivery mobile app','ed-tech platform','local mobile os','tech-enabled rural healthcare services','online student & campus social networking platform','online grocer','cloud software solutions','transportation & logistics platform','online budget hotel booking service','custom furniture marketplace','inspiration','travel guide mobile app','fashion','mobile app testing platform','restaurant reservation platform','private coaching centers','customer service platform','marketing / advertising automation platform','product customization platform','proximity marketing & mobile advertising platform','food customer analytics platform','gourmet food discovery & delivery platform','auto','healthy food manufacturer','online furniture marketplace','beauty & wellness services marketplace','government test preparation platform','organic food ecommerce','ridesharing mobile app','mobile advertising platform','online products discovery platform','b2b marketing','online food community platform','raw meat & ready to eat food etailer','travel community platform','travel information portal','branded budget hotel marketplace','restaurant reviews','corporate wellness app','internet network infrastructure services','luxury rental homes','product discovery & recommendation platform','food and beverage','saas product intelligence platform','finance','business and it consulting','consumer lending marketplace','hyperlocal grocery delivery','online marketplace for photographers','compliance','clinical genomics provider','offline tea chain','job board','real estate rating & analysis','online jewellery etailer','music streaming mobile app','on-demand healthcare marketplace','ecommerce product recommendation platform','self-driven car rental','parents & kids online platform','science learning app','medical tech instruments','self-driven vehicle rental','hospitality','food delivery platform','b2b marketplace for industrial goods','services','logistics automation platform','dental clinic chain','publishing','educational board games','furniture and appliances rental platform','online travel planning','numerical computing & data science platform','mobile car servicing appointment app','autorickshaw aggregator & booking platform','online insurance distribution platform','coupon aggregator platform','beauty & lifestyle mobile marketplace','online medical diagnostic','restaurant customer engagement platform','car maintenance & management mobile app','test automation saas platform','industrial tools marketplace','social media','video','private cloud networks saas platform','structural & civil engg service automation','international hiring platform','teacher empowerment platform','enterprise communication platform','hasbro toy manufacturer','last mile logistics','online apparels fashion brand','banking analytics platform','cloud enterprise mobility platform','energy','tech enabled logistics platform','online real estate marketplace','ethnic beverages manufacturer','talent exchange & talent services marketplace','online media publication','food tech','online jewelry store','premium beverages','hyper-local ecommerce','rail ticket confirmation predictor','payment services platform','online food-tech platform','content-based subscription ecommerce platform','real estate broker platform app','picture based social app','pre-owned games marketplace','tech-enabled learning','cab booking app platform','online meal-booking platform for train travelers','food & beverages','domestic help aggregation platform','hyperlocal mobile services marketplace','electronic goods recycling service','online food ordering marketplace','budget hotels aggregator','e-tech','online car portal','restaurant ratings & reviews platform','sales & productivity software','app based fitness coaching','gym & fitness studios subscription platform','online news media','mobile wallet','credit management services','social fitness platform','travel search engine','crm / analytics platform','ecommerce','hyperlocal services marketplace','cross-device retargeting platform','digital media publishing platform','transport','fashion ecommerce','online hotel booking','healthcare mobile app','beauty and wellness platform','entertainment','hyperlocal maintenance, & cleaning services','last minute travel deals mobile marketplace','online comparison engine','speech recognition solutions','startup funding marketplace','startup funding platform','ecommerce marketing software platform','automated storage & warehousing solution','probiotic technology products manufacturer','bespoke merchandize marketplace','social network','luxury label','online movie review platform','prepaid bill manager app','food-tech','ecommerce product search engine','coupons and cashback aggregator app','artificial intelligence platform','hyperlocal goods marketplace','healthcare it solutions & services','used car marketplace','education content provider','online & mobile classified listings','ai','designer fashion jewellery marketplace','custom merchandize platform','medical consultation & doctor appointment booking platform','credit card fraud protection solutions','multilingual test preparation platform','private jet bookings marketplace','alternate mobile monetization platform','b2b logistics delivery platform','financial services portal','global healthcare products','online table reservation','online recipe sharing platform','food subscription platform','global community for travellers','career development','hiring analytics platform','brand licensing startup','premium apparel shopping portal','gym discovery platform','fashion jewelry and accessories e-tailer','activity based social network','3d printer manufacturer','ecommerce data analytics platform','service-on-demand mobile app','mobile payment software platform','online logistics platform','food & beverage','cricket management mobile game','investment','gourmet meals delivery','mobile food ordering app','viral content web platform','mobile services marketplace','online job skills showcase','online office rental','hyperlocal mobile marketplace','information technology','logistics','consumer interne','b2c messaging app','online insurance aggregator','ecommerce logistics','price comparison','private label fashion etailer','transportation','healthy food online community','payments solution platform','subscription based online grocery platform','hotel mobile crm software platform','travel entertainment','financial tech','fashion ecommerce store','freight logistics platform','quick service restaurant chain','artist / designer marketplace','home healthcare services platform','nbfc','electric bike manufacturers','software','solar products and services marketplace','algorithmic match making platform','personalized styling platform','dairy based product manufacturer','grocery delivery platform','bus aggregation and rental mobile app','ed-tech','education','health, & beauty services app','renewable energy solutions','iot energy management analytics platform','gesture based mobile development','on-demand service marketplace','online renting platform','cab search comparison & booking platform','professionals & project search marketplace','hyper-local online services','online lingerie marketplace','celebrity fashion brand','anonymous bulletin board app','supply chain & logistics solutions','developer portfolio showcase platform','document digitization platform','organic food etailer','used vehicles marketplace','digital analytics platform','online security platform','grey collar job board','online homeopathy clinic','healthcare consulting platform','e-learning service provider','online lending marketplace','health mobile app','curated freelancer marketplace','consumer technology','chat based personal assistant app','artificial intelligence','private label lingerie ecommerce','online certification courses','on-demand beauty service','logistics solution provider','artificial intelligence ecommerce chatbot','smartwatch maker','taxi rental platform','health care','multi-sport program for preschoolers','marketplace app for bangkok','virtual health consultation app','beauty & wellness products e-tailer','social platform for traders and investors','peer-to-peer money transfer & recharge app','preventive healthcare services','social network for artists','intra-city logistics service','end to end reverse logistics solution platform','professional custom creators marketplace','job search platform','travel destination discovery platform','online coffee delivery platform','ecommerce discount & cashback coupons platform','event venue booking platform','data analytics platform','content management software solutions','physical storage warehouses','hyperlocal grocery app','mobile app development','used vehicle marketplace','online policy aggregator','online classifieds & listings','online furniture ecommerce','agtech','location based engagement & rewards platform','new curation mobile app','services platform','360-degree view creating platform','material collection & recycling','digital healthcare','data science & ux design learning platform','online & mobile grocery store','used bikes marketplace','community driven news/views platform','elearning platform','ecommerce delivery locker services','kids tool kit for innovation platform','easy business loans platform','online vehicle spare parts etailer','lifestyle ecommerce portal','customer service','ecommerce related software product platform','real estate','p2p payments platform','hyperlocal on-demand household services platform','it / customer engagement consulting','beauty & lifestyle platform','online financial services','grocery retail mobile app','online shopping assistant mobile app','doctor appointment booking app','rental accommodation search platform','hyperlocal logistics service','internet of things platform','language localization cloud platform','online grocery store','mobile learning solutions','product learning platform','real estate insights platform','video streaming','saas,','delivery & logistics service provider','chinese food delivery','online counselling and psychological support platform','online coupon & comparison platform','competitive exam learning platform','digital intelligent learning platform','auto insurance online platform','intelligent data analytics','rental accomodation finder','logistics service platform','agriculture','weight management service','qsr chain','beauty and wellness marketplace','hyperlocal food & grocery store','media','digital media platform','skill training startup','travel tech','fiinance','it infrastructure & data center services','loyalty programs & reward points','home rental platform','cloud based collaboration platform','online kitchen furniture','location based app','big data & analytics platform','food discovery & table booking app','financial services platform','affordable education','live video streaming app','video intelligence platform','fashion and apparel','food ordering & delivery app','content discovery & reward points platform','food','on-demand business messaging','hyperlocal shopping app','online consumer lending platform','cab rental mobile app','digital / mobile wallet','visual search and discovery platform','exclusive platform for doctors & healthcare professionals','end-to-end lending platform','real estate broker network app','on-demand laundry & dry cleaning app','last mile delivery service','cab aggregator','photographer online search & booking platform','on demand laundry service platform','extra curricular activities marketplace app','health and wellness','voice call incentivization mobile app','device repair svcs','hotel aggregator & booking platform','financial markets software','mobile social network','aerospace','data driven publishing platform','online diagnostic tests marketplace','big data & predictive analysis platform','investment management platform','mobile chat based concierge service','web content publishing','smart safety wearable devices','personal diagnostic mobile app','on-demand car services app','asset financing platform'];

  List<String> investmentType = ['angel','angel / seed funding','angel funding','angel round','bridge round','corporate round','crowd funding','debt','debt and preference capital','debt funding','debt-funding','equity','equity based funding','funding round','inhouse funding','maiden round','mezzanine','pre series a','pre-series a','private','private equity','private equity round','private funding','private\\\\nequity','privateequity','seed','seed / angel funding','seed / angle funding','seed funding','seed funding round','seed round','seed/ angel funding','seed/angel funding','seed\\\\nfunding','series a','series b','series b (extension)','series c','series d','series e','series f','series g','series h','series j','single venture','structured debt','term loan','venture','venture - series unknown','venture round'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Target your search",
              style: TextStyle( 
                  fontSize: 30, 
                  fontWeight: FontWeight.w800
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyAutocompleteTextField(
              suggestions: locations,
              placeholder: "Locations",
            ),
            const SizedBox(
              height: 20,
            ),
            MyAutocompleteTextField(
              suggestions: indVertical,
              placeholder: "Industry vertical",
            ),
            const SizedBox(
              height: 20,
            ),
            MyAutocompleteTextField(
              suggestions: investmentType,
              placeholder: "Funding Type",
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
              child: ElevatedButton(
                onPressed: () async {
                  widget.updateHomeRoutesIndex(1);
                },
                child: const Text('Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
