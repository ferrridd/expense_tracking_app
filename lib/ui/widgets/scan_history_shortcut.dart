import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/color_consts.dart';

class ScanHistoryShortcut extends StatelessWidget {
  const ScanHistoryShortcut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: appThemeNotifier.themeColors[1]),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Scan History",
                style: TextStyle(
                    color: appThemeNotifier.themeColors[4],
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: appThemeNotifier.themeColors[4],
                size: 40,
              )
            ],
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Last Scan",
                style: TextStyle(
                    color: appThemeNotifier.themeColors[4],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
        ]),
      ),
    );
  }
}
