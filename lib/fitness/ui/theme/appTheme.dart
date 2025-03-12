// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import '../../ui/theme/colors.dart';

enum AppTheme { Light, Dark }

final appThemeData = {
  AppTheme.Light: ThemeData(
      useMaterial3: false,
      shadowColor: primaryColor.withOpacity(0.25),
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: pageBackgroundColor,
      canvasColor: canvasColor,
      fontFamily: "Poppins", colorScheme: ThemeData().colorScheme.copyWith(
            secondary: secondaryColor,
          ).copyWith(background: backgroundColor)),
  AppTheme.Dark: ThemeData(
      useMaterial3: false,
      shadowColor: darkPrimaryColor.withOpacity(0.25),
      brightness: Brightness.dark,
      primaryColor: darkPrimaryColor,
      scaffoldBackgroundColor: darkPageBackgroundColor,
      canvasColor: darkCanvasColor,
      fontFamily: "Poppins", colorScheme: ThemeData().colorScheme.copyWith(
            brightness: Brightness.dark,
            secondary: darkSecondaryColor,
          ).copyWith(background: darkBackgroundColor)),
};
