import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/constants/colors.dart';
import 'package:off_beat_restaurant/constants/text_styles.dart';
import 'package:off_beat_restaurant/widgets/bottom_sheet_widget.dart';
import 'package:off_beat_restaurant/widgets/variations_widget.dart';

String specialRequestText =
    "Special requests are subject to the restaurant's approval. Tell us here what you want to share!";
String itemDetail =
    "Lorem ipsum dolor sit amet consectetur. Dignissim pulvinar non viverra pellentesque sollicitudin non risus. Proin a placerat nullam scelerisque tortor sit et sed semper.";

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    final mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: mqw,
              height: mqh * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/main_image.png'),
                  fit: BoxFit.cover,
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
                  Text('Rice with chicken',
                      style: TextStyles.offBeatTitle(context)),
                  SizedBox(
                    height: mqh * 0.01,
                  ),
                  Text(itemDetail, style: TextStyles.otherTitle(context)),
                  SizedBox(
                    height: mqh * 0.02,
                  ),
                  //Add variations part
                  Container(
                    padding: EdgeInsets.all(10),
                    //height: mqh * 0.3,
                    width: mqw,
                    decoration: BoxDecoration(
                      color: containerBackColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 227, 135, 243),
                          width: 1),
                    ),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Add variations',
                                  style: TextStyles.offBeatTitle(context)
                                      .copyWith(
                                          fontSize: mqw * 0.043,
                                          color: const Color.fromARGB(
                                              255, 56, 56, 56))),
                              Text(
                                '*Required',
                                style: TextStyles.otherTitle(context).copyWith(
                                    color: purpleColoredTexts,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                        SizedBox(height: mqh * 0.03),
                        variationsWidget(context, mqw, '1:1', '120'),
                        SizedBox(height: mqh * 0.03),
                        variationsWidget(context, mqw, '1:2', '240'),
                        SizedBox(height: mqh * 0.03),
                        variationsWidget(context, mqw, '1:4', '320'),
                        SizedBox(height: mqh * 0.02),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color(0XFFF0F0F0),
              thickness: mqh * 0.01,
            ),
            //special request part
            //SizedBox(height: mqh * 0.01),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Special requests',
                        style: TextStyles.offBeatTitle(context)
                            .copyWith(fontSize: mqw * 0.043),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '(Optional)',
                        style: TextStyles.otherTitle(context).copyWith(
                            fontSize: mqw * 0.043, color: Colors.grey),
                      )
                    ],
                  ),
                  Text(specialRequestText,
                      style: TextStyles.otherTitle(context)
                          .copyWith(color: Colors.grey)),
                  SizedBox(height: mqh * 0.02),
                  TextField(
                    maxLines: 5,
                    minLines: 2,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      hintText: 'e.g Hello',
                      hintStyle: TextStyles.otherTitle(context)
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: mqh * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '0/500',
                        style: TextStyles.otherTitle(context).copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
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
                                  style: TextStyles.otherTitle(context)
                                      .copyWith(
                                          color: Colors.black54,
                                          fontSize: mqh * 0.02),
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
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            //padding: EdgeInsets.all(16),
                            child: SingleChildScrollView(
                              child: itemDetailsPopUpWidget(context, mqw, mqh),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: purpleColoredTexts,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text(
                            "Add to cart",
                            style: TextStyles.offBeatTitle(context).copyWith(
                                color: Colors.white, fontSize: mqh * 0.025),
                          ),
                          Image.asset(
                            'assets/icons/mail.png',
                            scale: 3,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
