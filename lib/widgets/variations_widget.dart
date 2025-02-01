import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/constants/text_styles.dart';

Widget variationsWidget(
    BuildContext context, double mqw, String itemRatio, String aed) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Row(children: [
      Image.asset('assets/icons/checkmark-circle.png', scale: 3.5),
      SizedBox(
        width: 15,
      ),
      Text(itemRatio,
          style: TextStyles.otherTitle(context).copyWith(
            fontWeight: FontWeight.normal,
            fontSize: mqw * 0.035,
          ))
    ]),
    Text('AED $aed',
        style: TextStyles.offBeatTitle(context).copyWith(
          fontSize: mqw * 0.04,
        )),
  ]);
}
