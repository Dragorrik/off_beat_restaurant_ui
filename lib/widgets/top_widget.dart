import 'package:flutter/material.dart';

Widget topWidget(double mqh, double mqw) {
  return Container(
    height: mqh * 0.3,
    width: mqw,
    padding: EdgeInsets.all(15),
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/main_image.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/icons/arrow-left.png', scale: 3.2),
          Row(children: [
            Image.asset('assets/icons/favourite.png', scale: 3.2),
            SizedBox(width: 10),
            Image.asset('assets/icons/search.png', scale: 3.2),
            SizedBox(width: 10),
            Image.asset('assets/icons/more-vertical.png', scale: 3.2),
          ])
        ]),
  );
}
