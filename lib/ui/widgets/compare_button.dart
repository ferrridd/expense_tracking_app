import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/ui/screens/single_compare_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/size_consts.dart';

class CompareButtons extends StatelessWidget {
  final String title;
  final Widget screenName;
  const CompareButtons(
      {Key? key, required this.title, required this.screenName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SingleCompareScreen()),
        );
      },
      child: Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                Widget? child) =>
            Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConsts.borderRadius),
            color: appThemeNotifier.themeColors[1],
          ),
          child: Center(
              child: Text(
            this.title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: appThemeNotifier.themeColors[4],
            ),
          )),
        ),
      ),
    );
  }
}
