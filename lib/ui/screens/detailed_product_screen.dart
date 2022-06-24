import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/product_data.dart';
import 'package:expense_tracking_app/ui/widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../widgets/product_bar_chart.dart';

class DetailedProductScreen extends StatelessWidget {
  final Product product;
  const DetailedProductScreen({Key? key, required this.product})
      : super(key: key);

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
            imageAddress: product.imageLink,
            title: product.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  child: ProductBarChart(
                    data: product.productPriceInfo,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: appThemeNotifier.themeColors[4],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      color: appThemeNotifier.themeColors[4],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      product.description!,
                      style: TextStyle(
                        color: appThemeNotifier.themeColors[4],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
