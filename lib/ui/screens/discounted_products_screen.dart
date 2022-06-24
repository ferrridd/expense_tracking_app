import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:expense_tracking_app/models/product_data.dart';
import 'package:expense_tracking_app/ui/screens/detailed_product_screen.dart';
import 'package:expense_tracking_app/ui/widgets/discounted_product.dart';
import 'package:expense_tracking_app/ui/widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscountedProductsScreen extends StatelessWidget {
  const DiscountedProductsScreen({Key? key}) : super(key: key);

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
          child: SecondaryAppBar(title: "Discounted products"),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: products.discountedProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
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
                    child: (DiscountedProduct(
                      HigherPrice: products
                          .discountedProducts[index].productPriceInfo[0].price,
                      LowerPrice: products.discountedProducts[index]
                          .productPriceInfo[0].discountedPrice!,
                      title: products.discountedProducts[index].title,
                      imageAddress:
                          products.discountedProducts[index].imageLink,
                    )),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
