import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/ui/screens/compare_type_selector_screen.dart';
import 'package:expense_tracking_app/ui/screens/detailed_product_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/color_consts.dart';
import '../../models/product_data.dart';
import 'package:provider/provider.dart';

class CompareProductShortcut extends StatelessWidget {
  const CompareProductShortcut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: appThemeNotifier.themeColors[1]),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Compare",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: appThemeNotifier.themeColors[4]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompareTypeSelectorScreen()),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 40,
                  color: appThemeNotifier.themeColors[4],
                ),
              )
            ],
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Latest Compare",
                style: TextStyle(
                    fontSize: 20,
                    color: appThemeNotifier.themeColors[4],
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailedProductScreen(
                                product: Products.allProducts[0],
                              )),
                    );
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(Products.allProducts[0].imageLink),
                        radius: 34,
                      ),
                      Text(
                        Products.allProducts[0].title,
                        style: TextStyle(
                            fontSize: 18,
                            color: appThemeNotifier.themeColors[4]),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Column(
                    children: [
                      Text(
                        "\$${Products.allProducts[0].productPriceInfo[0].price.toString()}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Products.allProducts[0].productPriceInfo[0].store
                            .toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Column(
                    children: [
                      Text(
                        "\$${Products.allProducts[0].productPriceInfo[1].price.toString()}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Products.allProducts[0].productPriceInfo[1].store
                            .toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
