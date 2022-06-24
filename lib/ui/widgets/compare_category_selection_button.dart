import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/product_selected_notifier.dart';
import 'package:expense_tracking_app/models/selected_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/size_consts.dart';
import '../screens/search_for_product_screen.dart';
import '../screens/search_for_store_screen.dart';

class CompareCategorySelectionButton extends StatelessWidget {
  final String title;
  const CompareCategorySelectionButton({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductSelectedNotifier>(
      builder: (BuildContext context,
              ProductSelectedNotifier productSelectedNotifier, Widget? child) =>
          Consumer<SelectedNotifier>(
        builder: (BuildContext context, SelectedNotifier selectedNotifier,
                Widget? child) =>
            Consumer<AppThemeNotifier>(
          builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                  Widget? child) =>
              GestureDetector(
            onTap: () {
              selectedNotifier.onTappedAction();
              if (title == "Select Product") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchForProductScreen()),
                );
              } else if (title == "Select Store") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchForStoreScreen(
                            product: productSelectedNotifier.products[0],
                          )),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: appThemeNotifier.themeColors[1],
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
        ),
      ),
    );
  }
}
