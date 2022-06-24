import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LightThemeColors {
  LightThemeColors._();
  static const Color primaryBarColor = Color.fromARGB(255, 29, 72, 188);
  static const Color secondaryColor = Color.fromARGB(255, 213, 210, 210);
  static const Color secondaryGreyColor = Color.fromARGB(255, 227, 217, 217);
  static const Color appBackgroundColor = Colors.white;
  static const Color textColor = Colors.black;
  static var barColor = charts.ColorUtil.fromDartColor(Colors.blue);
  static const Color notSelectedColor = Color.fromARGB(255, 216, 213, 213);
}

class DarkThemeColors {
  DarkThemeColors._();
  static const Color primaryBarColor = Color.fromARGB(255, 103, 29, 188);
  static const Color secondaryColor = Color.fromARGB(255, 71, 71, 71);
  static const Color secondaryGreyColor = Color.fromARGB(255, 227, 217, 217);
  static const Color appBackgroundColor = Color.fromARGB(255, 0, 0, 0);
  static const Color textColor = Colors.white;
  static const Color notSelectedColor = Color.fromARGB(255, 117, 117, 117);
  static var barColor = charts.ColorUtil.fromDartColor(Colors.blue);
}
