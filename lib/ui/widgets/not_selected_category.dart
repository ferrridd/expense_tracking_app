import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/size_consts.dart';

class NotSelectedCategory extends StatelessWidget {
  final String title;
  const NotSelectedCategory({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          GestureDetector(
        onTap: () {
          Scaffold.of(context).showSnackBar(new SnackBar(
              content: new Text("Please select a product firstly")));
        },
        child: Container(
          decoration: BoxDecoration(
              color: appThemeNotifier.themeColors[5],
              borderRadius: BorderRadius.circular(SizeConsts.borderRadius)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    this.title,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: appThemeNotifier.themeColors[4],
                    ),
                  ),
                  ImageIcon(AssetImage("assets/images/select.png"),
                      color: appThemeNotifier.themeColors[4], size: 45),
                ]),
          ),
        ),
      ),
    );
  }
}
