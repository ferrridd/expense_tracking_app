import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/product_price_info.dart';
import 'package:expense_tracking_app/ui/widgets/compare_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceListView extends StatelessWidget {
  final List<ProductPriceInfo> productPriceInfo;
  const PriceListView({Key? key, required this.productPriceInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          Container(
        child: Column(children: [
          Center(
              child: Text(
            "Prices",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: appThemeNotifier.themeColors[4]),
          )),
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: productPriceInfo.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CompareInfo(
                        title: productPriceInfo[index].store,
                        price: productPriceInfo[index].price),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              })
        ]),
      ),
    );
  }
}
