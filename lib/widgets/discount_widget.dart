import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/constants/text_styles.dart';

Widget discountWidget(
    BuildContext context, Color color, String discount, String minOrder) {
  double mqw = MediaQuery.of(context).size.width;
  double mqh = MediaQuery.of(context).size.height;
  return Container(
      height: mqh * 0.13,
      width: mqw * 0.63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              SizedBox(
                width: 5,
              ),
              Image.asset('assets/icons/discount.png', scale: 3),
              SizedBox(width: 8),
              Text("$discount% off",
                  style: TextStyles.offBeatTitle(context)
                      .copyWith(color: Colors.white)),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text('upto $minOrder AED',
                      style: TextStyles.otherTitle(context).copyWith(
                          color: Colors.white, fontWeight: FontWeight.w300)),
                ],
              )
            ]),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/delivery rider_white.png',
                    scale: 3.2,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Free delivery",
                      style: TextStyles.otherTitle(context).copyWith(
                          fontSize: mqw * 0.025, color: Colors.white)),
                ],
              ),
            ),
          )
        ],
      ));
}
