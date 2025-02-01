import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/constants/colors.dart';
import 'package:off_beat_restaurant/constants/text_styles.dart';
import 'package:off_beat_restaurant/screens/items_screen.dart';

String itemDescription =
    "250 gm - Tangy & spicy, a smash of chicken and cheese with mustard oil";

Widget itemWidget(
    BuildContext context, double mqh, double mqw, String section) {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //image
      children: [
        Image.asset(
          'assets/images/pizza.png',
          fit: BoxFit.cover,
          height: mqh * 0.15,
          width: mqw * 0.22,
        ),
        // SizedBox(
        //   width: 15,
        // ),
        //description
        SizedBox(
          height: mqh * 0.15,
          width: mqw * 0.52,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$section margherita',
                style: TextStyles.offBeatTitle(context)
                    .copyWith(fontSize: mqh * 0.02),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                itemDescription,
                style: TextStyles.otherTitle(context),
              ),
              Row(
                children: [
                  Image.asset('assets/icons/fire.png', scale: 5),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Popular',
                    style: TextStyles.otherTitle(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: mqh * 0.015,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "AED 120",
                    style: TextStyles.offBeatTitle(context).copyWith(
                      color: purpleColoredTexts,
                      fontSize: mqh * 0.024,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text('AED 150',
                      style: TextStyles.offBeatTitle(context).copyWith(
                          color: const Color.fromARGB(255, 148, 146, 146),
                          fontSize: mqh * 0.024,
                          decoration: TextDecoration.lineThrough)),
                ],
              )
            ],
          ),
        ),
        // SizedBox(
        //   width: 10,
        // ),
        //Ratings and button
        Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 215, 163),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Image.asset('assets/icons/star.png', scale: 5),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '4.8',
                    style: TextStyles.otherTitle(context).copyWith(
                      fontSize: mqh * 0.014,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mqh * 0.08,
            ),
            Icon(
              Icons.add,
              color: purpleColoredTexts,
            )
          ],
        )
      ],
    ),
  );
}
