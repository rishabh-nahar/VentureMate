import 'package:flutter/material.dart';
import 'package:venturemate/utlis/global.color.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal({Key? key, required this.controller, required this.text, required this.textInputType, required this.obscure}) : super(key: key);
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: GlobalColors.lightThemeColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: GlobalColors.darkThemeColor.withOpacity(0.1)),
          ]
        ),
        child: TextFormField(
            controller:  controller,
            keyboardType: textInputType,
            obscureText: obscure,
            decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none
          ),
        ),
    );
  }
}