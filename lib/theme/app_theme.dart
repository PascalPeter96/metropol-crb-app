import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTheme {
  static const white = Colors.white;
  static const black = Colors.black;
  static const gray45 = Color(0xFFB5B5B6);
  static const textFieldFillColor = Color(0xFFF2F1F6);
  static const purpleTextColor = Color(0xFF15173d);
  static const inActiveColor = Colors.grey;
  static const textBoxColor = Colors.white;
  static const darker = Color(0xFF3E4249);
  static const orange = Colors.orange;
  static const green = Colors.green;

  static Color get backgroundColor => const Color(0xfff5f5f5);

  // static Color get primaryColor => const Color(0xff149c48);
  static Color get primaryColor => Colors.deepPurple;

  static Color get primaryLightColor => const Color(0xffc8edd9);

  static Color get subtitleTextColor => const Color(0xFF8391A1);

  static Color get inputBackground => const Color(0xffF7F8F9);

  static TextStyle get appHeader => TextStyle(
    // color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );


  static TextStyle get appTitle => TextStyle(
    // color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get purpleAppHeader => TextStyle(
    color: AppTheme.primaryColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get purplePriceText20 => TextStyle(
    color: AppTheme.primaryColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get purpleSubText => TextStyle(
    color: primaryColor,
    fontSize: 17.5.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get showMoreText => TextStyle(
    color: AppTheme.primaryColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get showLessText => TextStyle(
    color: AppTheme.orange,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get whiteAppHeader => TextStyle(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get priceText16 => TextStyle(
    color: AppTheme.primaryColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get priceText18 => TextStyle(
    color: AppTheme.primaryColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );


  static TextStyle get normalText => TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    // fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get countText => TextStyle(
    color: AppTheme.primaryColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get cardTitle => TextStyle(
    // color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
    fontSize: 17.5.sp,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get purpleCardTitle => TextStyle(
    // color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
    fontSize: 17.5.sp,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.righteous().fontFamily,
    color: purpleTextColor
  );

  static TextStyle get greenScoreText => TextStyle(
    // color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
      fontSize: 17.5.sp,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.righteous().fontFamily,
      color: green
  );

  static TextStyle get cardTitle16 => TextStyle(
    // color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get sectionTitleText => TextStyle(
    // color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
    fontSize: 17.5.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get onboardTitleText => TextStyle(
    // color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get onboardSubText => TextStyle(
    // color: ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w100,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get appSubText => TextStyle(
    color: gray45,
    fontSize: 17.5.sp,
    fontWeight: FontWeight.w100,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get purpleSubText175 => TextStyle(
    color: AppTheme.primaryColor,
    fontSize: 17.5.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );

  static TextStyle get whiteButtonText => TextStyle(
    color: Colors.white,
    fontSize: 17.5.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.righteous().fontFamily,
  );


  static EdgeInsets get mainAxisPadding =>  EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h);
  static EdgeInsets get mainCardAxisPadding =>  EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h);

  static BorderRadius get borderRadius20 => BorderRadius.circular(20.sp);

}