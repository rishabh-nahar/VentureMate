import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}



class GlobalColors{
  // main color
  static HexColor primaryColor = HexColor('#08a8fe');
  static HexColor secondaryColor = HexColor('#00ADB5');
  static HexColor darkThemeColor = HexColor('#222831');
  static HexColor lightThemeColor = HexColor('#EEEEEE');

}

