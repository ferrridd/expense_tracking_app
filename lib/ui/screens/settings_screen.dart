import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/ui/widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';

import '../../constants/color_consts.dart';
import '../../models/settings_model.dart';
import '../widgets/choose_screen.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
            child: SecondaryAppBar(
              title: "Settings",
            )),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: settingsModelList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: (ChooseScreen(
                      imageAdress: settingsModelList[index].imageAddress,
                      title: settingsModelList[index].name)),
                );
              }),
        ),
      ),
    );
  }
}
