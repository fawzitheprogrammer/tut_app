import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = '#ED9728'.toColor;
  // static Color darkGrey = '#525252';
  // static Color grey = '#737477';
  // static Color lightGrey = '#9E9E9E';
  // static Color greyshBlue = '#304654';
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
