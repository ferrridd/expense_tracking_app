import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/constants/size_consts.dart';
import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/data_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseScreen extends StatelessWidget {
  final String title;
  final String imageAdress;
  const ChooseScreen({Key? key, required this.imageAdress, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConsts.borderRadius),
            color: appThemeNotifier.themeColors[1]),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Consumer<AppThemeNotifier>(
            builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                    Widget? child) =>
                GestureDetector(
              onTap: () {
                if (this.title == "App Theme") {
                  appThemeNotifier.onItemTapped();
                  debugPrint(storeList.toString());
                }
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: appThemeNotifier.themeColors[4],
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    ImageIcon(
                      AssetImage(imageAdress),
                      size: 50,
                      color: appThemeNotifier.themeColors[4],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
