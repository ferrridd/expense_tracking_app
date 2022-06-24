import 'package:flutter/material.dart';

import '../../constants/color_consts.dart';
import '../../constants/size_consts.dart';

class ProductInfo extends StatelessWidget {
  final String date;
  final int count;
  final double price;
  const ProductInfo(
      {Key? key, required this.count, required this.date, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConsts.borderRadius),
          color: LightThemeColors.secondaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Row(
                    children: [
                      Text(count.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        child: Text("\$" + price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
