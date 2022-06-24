import 'package:flutter/material.dart';

import '../../constants/color_consts.dart';
import '../../constants/size_consts.dart';

class CartInfo extends StatelessWidget {
  final List<String> allProducts;
  const CartInfo({Key? key, required this.allProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConsts.borderRadius),
        color: LightThemeColors.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageIcon(
              AssetImage("assets/images/cart.png"),
              size: 60,
              color: Colors.black,
            ),
            SizedBox(
              width: 80,
            ),
            Flexible(
              child: Text(
                allProducts.join(","),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
