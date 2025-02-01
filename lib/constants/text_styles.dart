import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle offBeatTitle(BuildContext context) {
    double mqw = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: mqw * 0.05,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle otherTitle(BuildContext context) {
    double mqw = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: mqw * 0.03,
    );
  }
}
