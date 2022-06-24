import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/product_selected_notifier.dart';
import 'package:expense_tracking_app/models/selected_notifier.dart';
import 'package:expense_tracking_app/models/store_selected_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedProductListile extends StatelessWidget {
  final String imageLink;
  final String title;
  const SelectedProductListile(
      {Key? key, required this.imageLink, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductSelectedNotifier>(
      builder: (BuildContext context,
              ProductSelectedNotifier productSelectedNotifier, Widget? child) =>
          Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                Widget? child) =>
            Container(
          decoration: BoxDecoration(
            color: appThemeNotifier.themeColors[1],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              leading: Image.network(
                imageLink,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: appThemeNotifier.themeColors[4],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Consumer<SelectedNotifier>(
                builder: (BuildContext context,
                        SelectedNotifier selectedNotifier, Widget? child) =>
                    Consumer<StoreSelectedNotififer>(
                  builder: (BuildContext context,
                          StoreSelectedNotififer storeSelectedNotififer,
                          Widget? child) =>
                      GestureDetector(
                    onTap: () {
                      storeSelectedNotififer.allRemoved();
                      selectedNotifier.productRemoved();
                      productSelectedNotifier.productIsRemoved();
                    },
                    child: Icon(Icons.highlight_remove_outlined,
                        color: appThemeNotifier.themeColors[4]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
