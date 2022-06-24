import 'package:charts_flutter/flutter.dart' as charts;

import '../constants/color_consts.dart';

class ProductPriceInfo {
  final double price;
  final String store;
  final String storeLocation;
  final double? discountedPrice;
  final charts.Color barColor = LightThemeColors.barColor;

  ProductPriceInfo({
    required this.price,
    required this.store,
    required this.storeLocation,
    this.discountedPrice,
  });
  factory ProductPriceInfo.fromJson(Map<String, dynamic> json) =>
      ProductPriceInfo(
        price: json["price"],
        store: json["store"],
        storeLocation: json["storeLocation"],
        discountedPrice:
            json["discountedPrice"] == null ? null : json["discountedPrice"],
      );
  Map<String, dynamic> toJson() => {
        "price": price,
        "store": store,
        "storeLocation": storeLocation,
        "amount": discountedPrice == null ? null : discountedPrice
      };
}
