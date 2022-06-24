import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/product_data.dart';
import 'package:expense_tracking_app/ui/screens/discounted_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/detailed_product_screen.dart';

class DiscountedProductShortcut extends StatelessWidget {
  const DiscountedProductShortcut({Key? key}) : super(key: key);

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
                "Discounted products",
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
                        builder: (context) => const DiscountedProductsScreen()),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: appThemeNotifier.themeColors[4],
                  size: 40,
                ),
              )
            ],
          ),
          Container(
            height: 110,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: products.discountedProducts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailedProductScreen(
                                    product: products.discountedProducts[index],
                                  )),
                        );
                      },
                      child: (Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                products.discountedProducts[index].imageLink),
                            radius: 34,
                          ),
                          Flexible(
                            child: Text(
                              products.discountedProducts[index].title,
                              style: TextStyle(
                                fontSize: 18,
                                color: appThemeNotifier.themeColors[4],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
