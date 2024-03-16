// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late MediaQueryData mediaQuery;
  static late double Height;
  static late double Width;
  static late double textSize;

  void init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    Height = mediaQuery.size.height;
    Width = mediaQuery.size.width;
    textSize = mediaQuery.textScaleFactor;
  }
}
