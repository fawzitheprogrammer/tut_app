import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = '#ED9728'.toColor;
  static Color darkGrey = '#525252'.toColor;
  static Color grey = '#737477'.toColor;
  static Color lightGrey = '#9E9E9E'.toColor;
  static Color greyshBlue = '#304654'.toColor;
 
  static Color darkPrimary = '#d17d11'.toColor;
  static Color lightPrimary = '#CCd17d11'.toColor; // Here CC represents the 80%  opacity 
  static Color grey1 = '#707070'.toColor;
  static Color grey2 = '#797979'.toColor;
  static Color white = '#FFFFFF'.toColor;
  static Color error = '#e61f34'.toColor;
}

extension ColorsEx on String {
  Color get toColor {
    // removing # from the string
    final String hexColor = replaceFirst('#', '');

    // If color is 6 digi hex code
    if (hexColor.length == 6) {
      final int colorVal = int.parse('FF$hexColor', radix: 16);
      return Color(colorVal);

      // If color is 8 digi hex code
    } else if (hexColor.length == 8) {
      final int colorVal = int.parse(hexColor, radix: 16);
      return Color(colorVal);
    } else {
      return const Color(0xFF000000);
    }
  }
}
