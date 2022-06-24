import 'package:expense_tracking_app/constants/color_consts.dart';
import 'package:expense_tracking_app/constants/size_consts.dart';
import 'package:expense_tracking_app/models/apptheme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscountedProduct extends StatelessWidget {
  final String title;
  final String imageAddress;
  final double HigherPrice;
  final double LowerPrice;
  const DiscountedProduct(
      {Key? key,
      required this.title,
      required this.imageAddress,
      required this.HigherPrice,
      required this.LowerPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier appThemeNotifier,
              Widget? child) =>
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConsts.borderRadius),
                color: appThemeNotifier.themeColors[1],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(imageAddress),
                          radius: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: appThemeNotifier.themeColors[4],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$" + HigherPrice.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        Icon(Icons.arrow_right_alt),
                        Text(
                          "\$" + LowerPrice.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        )
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
