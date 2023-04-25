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
        color: profit? _bgColor0 : _bgColor1,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( 
                    widget.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.darkThemeColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: GlobalColors.darkThemeColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
