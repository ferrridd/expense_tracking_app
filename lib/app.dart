import 'package:expense_tracking_app/models/product_selected_notifier.dart';
import 'package:expense_tracking_app/models/selected_notifier.dart';
import 'package:expense_tracking_app/models/store_selected_notifier.dart';
import 'package:expense_tracking_app/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/apptheme_notifier.dart';
import 'models/bottom_bar_item_notifier.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StoreSelectedNotififer()),
        ChangeNotifierProvider(create: (_) => ProductSelectedNotifier()),
        ChangeNotifierProvider(create: (_) => SelectedNotifier()),
        ChangeNotifierProvider(create: (_) => BottomBarItemNotifier()),
        ChangeNotifierProvider(create: (_) => AppThemeNotifier())
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
