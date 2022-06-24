import 'package:flutter/material.dart';

import '../../constants/color_consts.dart';

class AccoundHeading extends StatelessWidget {
  final String name;
  final String? imageAdress;
  const AccoundHeading({Key? key, required this.name, this.imageAdress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            imageAdress != null
                ? CircleAvatar(
                    backgroundImage: AssetImage(imageAdress!),
                    radius: MediaQuery.of(context).size.height * 0.06,
                  )
                : ImageIcon(
                    AssetImage('assets/images/account.png'),
                    size: MediaQuery.of(context).size.height * 0.12,
                    color: Colors.black,
                  ),
            Text(this.name,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        ));
  }
}
