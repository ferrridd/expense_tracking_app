import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomescreenAppBar extends StatelessWidget {
  const HomescreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          AppBar(
        centerTitle: true,
        leading: ImageIcon(
          AssetImage('assets/images/account.png'),
          size: 34,
          color: appThemeNotifier.themeColors[4],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
              child: Icon(
                Icons.settings,
                color: appThemeNotifier.themeColors[4],
              ),
            ),
          )
        ],
        title: Text(
          'Home',
          style: TextStyle(
              fontSize: 24,
              color: appThemeNotifier.themeColors[4],
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: appThemeNotifier.themeColors[0],
      ),
    );
  }
}
