import 'dart:ui';

import 'package:rizz/common/utils.dart';

class GlobalVariables {
  static double deviceWidth =
      window.physicalSize.width / window.devicePixelRatio;
  static double deviceHeight =
      window.physicalSize.height / window.devicePixelRatio;
  static Color themeColor = HexColor("FD630F");

//  static String? uid;
  static String? username;
  static String? snapchat;
  static int? age;
  static String? gender = '';
  static List<String> photoURLs = [];
}
