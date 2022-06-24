import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/apptheme_notifier.dart';

class SecondaryAppBar extends StatelessWidget {
  final String title;
  final String? imageAddress;
  const SecondaryAppBar({Key? key, required this.title, this.imageAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          AppBar(
        centerTitle: true,
        actions: [
          imageAddress != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageAddress!),
                    radius: 25,
                  ),
                )
              : Container(),
        ],
        backgroundColor: appThemeNotifier.themeColors[0],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: appThemeNotifier.themeColors[4],
            size: 30,
          ),
        ),
        title: Text(this.title,
            style: TextStyle(
              color: appThemeNotifier.themeColors[4],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
