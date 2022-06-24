import 'package:expense_tracking_app/models/shopping_info.dart';
import 'package:flutter/material.dart';

import '../../constants/color_consts.dart';
import '../../constants/size_consts.dart';

class ScanHistory extends StatelessWidget {
  final ShoppingInfo shoppingInfo;
  final List<String> titles;
  final double wyb;
  final double rn;
  const ScanHistory(
      {Key? key,
      required this.shoppingInfo,
      required this.titles,
      required this.rn,
      required this.wyb})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: 100, minWidth: double.infinity, maxHeight: 400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConsts.borderRadius),
        color: LightThemeColors.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                shoppingInfo.date,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                shoppingInfo.hour,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                shoppingInfo.address,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.only(left: 200),
              child: Row(
                children: [
                  Text(
                    "WYB",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "RN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  child: Text(
                titles.join(", "),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 90.0),
                child: Text(
                  wyb.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 50),
                child: Text(
                  rn.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
