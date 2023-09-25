import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ColorManager {//0xff003393
  static Color secondary = const Color.fromARGB(255, 14, 133, 230).withOpacity(0.8);
  static Color primary= const Color.fromARGB(255, 8, 79, 212).withOpacity(0.8);
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color lightGrey = const Color(0xff9E9E9E);

  // new colors
  static Color darkPrimary = const Color(0xffd17d11);
  static Color lightPrimary = const Color(0xCCd17d11); // color with 80% opacity
  static Color grey1 =  Colors.grey.shade600;
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red color
}
