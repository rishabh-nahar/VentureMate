import 'package:flutter/material.dart';
import 'package:venturemate/utlis/global.color.dart';

class ModernCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool profit;

  const ModernCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.profit,
  }) : super(key: key);

  @override
  State<ModernCard> createState() => _ModernCardState();
}

class _ModernCardState extends State<ModernCard> {
  Color _bgColor1 = Colors.red.shade200;
  Color _bgColor0 = Colors.green.shade200;
  
  bool profit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profit = widget.profit;
  }
  
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        // elevation: 2.0,
        color: GlobalColors.lightThemeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: 
                      [
                        Text( 
                          capitalizeFirstLetter(widget.title),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: GlobalColors.darkThemeColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          capitalizeFirstLetter(widget.subtitle),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            color: GlobalColors.darkThemeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child:  profit? Icon(Icons.trending_up ,color: _bgColor0,) : Icon(Icons.trending_down, color: _bgColor1,),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String capitalizeFirstLetter(String str) {
  if (str == null || str.isEmpty) {
    return str;
  }
  return str.replaceRange(0, 1, str.substring(0, 1).toUpperCase());
}
