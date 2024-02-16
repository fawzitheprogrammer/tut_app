import 'package:flutter/material.dart';
import 'package:tut_app/presentation/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // Card view theme

    // App bar theme

    // Button theme

    // Text Theme

    // Input decoration
  );
}
