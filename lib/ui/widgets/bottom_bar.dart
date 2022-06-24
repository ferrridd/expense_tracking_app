import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/bottom_bar_item_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          Consumer<BottomBarItemNotifier>(
        builder: (BuildContext context,
                BottomBarItemNotifier bottomBarItemNotifier, Widget? child) =>
            BottomNavigationBar(
                backgroundColor: appThemeNotifier.themeColors[0],
                selectedItemColor: Colors.white,
                currentIndex: bottomBarItemNotifier.selectedIndex,
                onTap: bottomBarItemNotifier.onItemTapped,
                items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/home.png'),
                  size: 45,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/qrCodeScan.png'),
                  size: 45,
                ),
                label: 'Scanner',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/scan-icon-0.png'),
                  size: 45,
                ),
                label: 'Scan History',
              ),
            ]),
      ),
    );
  }
}
