import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/models/storage.dart';
import 'package:flutter/cupertino.dart';

class AppThemeNotifier extends ChangeNotifier {
  bool appTheme = storageData.read("apptheme");
  List<Color> themeColors = !storageData.read("apptheme")
      ? [
          LightThemeColors.primaryBarColor,
          LightThemeColors.secondaryColor,
          LightThemeColors.secondaryGreyColor,
          LightThemeColors.appBackgroundColor,
          LightThemeColors.textColor,
          LightThemeColors.notSelectedColor,
        ]
      : [
          DarkThemeColors.primaryBarColor,
          DarkThemeColors.secondaryColor,
          DarkThemeColors.secondaryGreyColor,
          DarkThemeColors.appBackgroundColor,
          DarkThemeColors.textColor,
          DarkThemeColors.notSelectedColor,
        ];
  void onItemTapped() async {
    this.appTheme = !this.appTheme;
    await storageData.write("apptheme", appTheme);
    if (this.appTheme == false) {
      themeColors = [
        LightThemeColors.primaryBarColor,
        LightThemeColors.secondaryColor,
        LightThemeColors.secondaryGreyColor,
        LightThemeColors.appBackgroundColor,
        LightThemeColors.textColor,
        LightThemeColors.notSelectedColor,
      ];
    } else {
      themeColors = [
        DarkThemeColors.primaryBarColor,
        DarkThemeColors.secondaryColor,
        DarkThemeColors.secondaryGreyColor,
        DarkThemeColors.appBackgroundColor,
        DarkThemeColors.textColor,
        DarkThemeColors.notSelectedColor,
      ];
    }
    debugPrint(storageData.read("apptheme").toString());
    notifyListeners();
  }
}
