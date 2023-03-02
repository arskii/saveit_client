import 'package:flutter/material.dart';

const textPrimary = Color(0xff2C283E);
const textActive = Color(0xff3F27B4);
const textGray = Color(0xffAEABC2);

const mainColor = Color(0xff67EACA);
const secondColor = Color(0xffFCF9EC);
const accentColor = Color(0xff1FAB89);

class AppTheme {
  static ThemeData lightTheme(ColorScheme? lightColorScheme) {
    ColorScheme scheme =
        lightColorScheme ?? ColorScheme.fromSeed(seedColor: accentColor);
    return ThemeData(colorScheme: scheme);
  }

  static ThemeData darkTheme(ColorScheme? darkColorScheme) {
    ColorScheme scheme = darkColorScheme ??
        ColorScheme.fromSeed(
            seedColor: accentColor, brightness: Brightness.dark);
    return ThemeData(colorScheme: scheme);
  }
}
