import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/constants/colors.dart';
import 'package:off_beat_restaurant/constants/text_styles.dart';
import 'package:off_beat_restaurant/screens/item_details_screen.dart';

Widget itemDetailsPopUpWidget(BuildContext context, double mqw, double mqh) {
  return Column(
    children: [
      Container(
        width: mqw,
        height: mqh * 0.3,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_image.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ),
      //SizedBox(height: mqh * 0.02),
      //Title part
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rice with chicken', style: TextStyles.offBeatTitle(context)),
            SizedBox(
              height: mqh * 0.01,
            ),
            Text(itemDetail, style: TextStyles.otherTitle(context)),
            SizedBox(
              height: mqh * 0.02,
            ),
          ],
        ),
      ),

      //SizedBox(height: mqh * 0.01),
      //special request part
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: mqh * 0.05),
            //Add to cart part
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: mqh * 0.07,
                  decoration: BoxDecoration(
                    color: Color(0XFFFAF2F7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'AED 120',
                        style: TextStyles.offBeatTitle(context).copyWith(
                          color: purpleColoredTexts,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' (1 item)',
                            style: TextStyles.otherTitle(context).copyWith(
                                color: Colors.black54, fontSize: mqh * 0.02),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0XFFFAF2F7),
                      ),
                      child: Icon(Icons.delete_outline_outlined),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '1',
                      style: TextStyles.offBeatTitle(context),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0XFFFAF2F7),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: purpleColoredTexts,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    "Add to cart",
                    style: TextStyles.offBeatTitle(context)
                        .copyWith(color: Colors.white, fontSize: mqh * 0.025),
                  ),
                  Image.asset(
                    'assets/icons/mail.png',
                    scale: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
