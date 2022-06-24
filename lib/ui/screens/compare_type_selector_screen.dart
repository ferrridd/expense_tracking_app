import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/ui/screens/single_compare_screen.dart';
import 'package:expense_tracking_app/ui/widgets/compare_category_selection_button.dart';
import 'package:expense_tracking_app/ui/widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/compare_button.dart';

class CompareTypeSelectorScreen extends StatelessWidget {
  const CompareTypeSelectorScreen({Key? key}) : super(key: key);

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
            child: SecondaryAppBar(title: "Select Compare Type")),
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CompareButtons(
                    title: "Single Compare",
                    screenName: SingleCompareScreen(),
                  ),
                  CompareButtons(
                      title: "Cart Compare", screenName: SingleCompareScreen()),
                ]),
          ),
        ),
      ),
    );
  }
}
