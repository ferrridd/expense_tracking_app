import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/models/product_data.dart';
import 'package:expense_tracking_app/models/product_price_info.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class ProductBarChart extends StatelessWidget {
  final List<ProductPriceInfo> data;
  const ProductBarChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ProductPriceInfo, String>> series = [
      charts.Series(
        id: "Prices",
        data: data,
        domainFn: (ProductPriceInfo product, _) => product.store,
        measureFn: (ProductPriceInfo product, _) => product.price,
        colorFn: (ProductPriceInfo product, _) => product.barColor,
      )
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: charts.BarChart(
              series,
              animate: true,
            ),
          ),
        ],
      ),
    );
  }
}
