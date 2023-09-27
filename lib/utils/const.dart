import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Colorss {
  static const backGroundColor = Color(0xff121421);
  static const foreBackgroundColor = Color(0xff262B3F);
  static const textColor = Color(0xffFFFFFF);
  static const softTextColor = Color(0xffCBCBCB);
  static const theme01Color = Color(0xff8800FF);
}

class Styles {
  static TextStyle get smallTextStyle => GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colorss.textColor,
      );
  static TextStyle get mediumTextStyle => GoogleFonts.montserrat(
        fontSize: 19.sp,
        fontWeight: FontWeight.w500,
        color: Colorss.textColor,
      );
  static TextStyle get bigTextStyle => GoogleFonts.montserrat(
        fontSize: 21.sp,
        fontWeight: FontWeight.w500,
        color: Colorss.textColor,
      );
  static TextStyle get smallTitleStyle => GoogleFonts.montserrat(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: Colorss.textColor,
      );
  static TextStyle get bigTitleStyle => GoogleFonts.montserrat(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: Colorss.textColor,
      );
}

class Const {
  static const apiUrl = "https://newsapi.org/v2/";
  static const apiGPT = "https://api.openai.com/";
  static const apiKey = "c9eb1bc80bf34292a272b92b3f7081d8";
  static const apiKeyGPT = "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";
}
