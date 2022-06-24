import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/constants/size_consts.dart';
import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/ui/widgets/compare_product_shortcut.dart';

import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';

import '../widgets/discounted_product_shortcut.dart';
import '../widgets/homescreen_app_bar.dart';

import '../widgets/scan_history_shortcut.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          Scaffold(
        backgroundColor: appThemeNotifier.themeColors[3],
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
            child: HomescreenAppBar()),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  DiscountedProductShortcut(),
                  SizedBox(
                    height: SizeConsts.sizedBoxHeight,
                  ),
                  CompareProductShortcut(),
                  SizedBox(
                    height: SizeConsts.sizedBoxHeight,
                  ),
                  ScanHistoryShortcut(),
                ],
              )),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
