import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../constants/color_consts.dart';
import '../../constants/size_consts.dart';

class ProductInCartInfo extends StatelessWidget {
  final List<String> titles;
  final List<int> counts;
  final List<String> imageAddresses;
  const ProductInCartInfo(
      {Key? key,
      required this.titles,
      required this.counts,
      required this.imageAddresses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConsts.borderRadius),
        color: LightThemeColors.secondaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(18),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(titles[index],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text(counts[index].toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                CircleAvatar(
                  backgroundImage: AssetImage(imageAddresses[index]),
                  radius: 15,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
