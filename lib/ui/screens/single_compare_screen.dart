import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/product_selected_notifier.dart';
import 'package:expense_tracking_app/models/selected_notifier.dart';
import 'package:expense_tracking_app/models/store_selected_notifier.dart';
import 'package:expense_tracking_app/ui/widgets/compare_category_selection_button.dart';
import 'package:expense_tracking_app/ui/widgets/not_selected_category.dart';
import 'package:expense_tracking_app/ui/widgets/price_list_view.dart';
import 'package:expense_tracking_app/ui/widgets/secondary_app_bar.dart';
import 'package:expense_tracking_app/ui/widgets/selected_product_listile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleCompareScreen extends StatelessWidget {
  const SingleCompareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreSelectedNotififer>(
      builder: (BuildContext context,
              StoreSelectedNotififer storeSelectedNotififer, Widget? child) =>
          Consumer<ProductSelectedNotifier>(
        builder: (BuildContext context,
                ProductSelectedNotifier productSelectedNotifier,
                Widget? child) =>
            Consumer<AppThemeNotifier>(
          builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
                  Widget? child) =>
              Consumer<SelectedNotifier>(
            builder: (BuildContext context, SelectedNotifier selectedNotifier,
                    Widget? child) =>
                Scaffold(
              backgroundColor: appThemeNotifier.themeColors[3],
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.08),
                  child: SecondaryAppBar(title: "Single Compare")),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.all(12),
                  child: Column(children: [
                    CompareCategorySelectionButton(title: "Select Product"),
                    SizedBox(
                      height: 10,
                    ),
                    selectedNotifier.isSelected == true
                        ? CompareCategorySelectionButton(title: "Select Store")
                        : NotSelectedCategory(title: "Select Store"),
                    SizedBox(
                      height: 12,
                    ),
                    productSelectedNotifier.products.isEmpty == false
                        ? SelectedProductListile(
                            imageLink:
                                productSelectedNotifier.products[0].imageLink,
                            title: productSelectedNotifier.products[0].title)
                        : Container(),
                    productSelectedNotifier.products.isEmpty == false
                        ? storeSelectedNotififer.pricesInStores.isEmpty == false
                            ? PriceListView(
                                productPriceInfo:
                                    storeSelectedNotififer.pricesInStores)
                            : Container()
                        : Container()
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
