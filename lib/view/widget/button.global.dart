import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:venturemate/utlis/global.color.dart';


class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal({Key? key,required this.buttonVal }) : super(key: key);

  final String buttonVal; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: GlobalColors.primaryColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: GlobalColors.darkThemeColor.withOpacity(0.1),
              blurRadius: 10,
            )
          ]
        ),
        child: Text(
          buttonVal,
          style: TextStyle(
            color: GlobalColors.lightThemeColor,
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),
        )
      ),
    );
  }
}