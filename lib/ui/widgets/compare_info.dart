import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/color_consts.dart';
import '../../constants/size_consts.dart';

class CompareInfo extends StatelessWidget {
  final String title;
  final double price;
  const CompareInfo({Key? key, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          Container(
        decoration: BoxDecoration(
            color: appThemeNotifier.themeColors[1],
            borderRadius: BorderRadius.circular(SizeConsts.borderRadius - 10)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "\$" + this.price.toString(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: appThemeNotifier.themeColors[4],
              ),
            ),
            Text(
              this.title,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: appThemeNotifier.themeColors[4],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
