import 'package:education_system/extensions/relative_length.dart';
import 'package:flutter/material.dart';

class ConstantsColors {
  static const Color primaryColor = Color(0xff349946);
  static const Color greenColor = Color(0xff66C766);
  static const Color secondaryColor = Color(0xff031143);
  static const Color titleColor = Color(0xff1E301D);
  static const Color starColor = Color(0xffF2C144);
  static const Color greyColor = Color(0xffEDEEF0);
}

class AppStyles {
  static String primaryFont = 'NeoSans';

  static TextStyle primaryStyle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 4.3.vw,
    color: ConstantsColors.titleColor,
    fontWeight: FontWeight.w500,
  );
    static TextStyle secondaryStyle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 3.7.vw,
    color: ConstantsColors.secondaryColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle infoStyle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 3.7.vw,
    color: const Color(0xff8E85A7),
    fontWeight: FontWeight.w400,
  );
  static TextStyle titleStyle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 4.8.vw,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
   static TextStyle whiteStyle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 4.3.vw,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
