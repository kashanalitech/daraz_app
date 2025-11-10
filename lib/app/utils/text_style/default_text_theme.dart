import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_assets/app_assets.dart';
import '../color/color.dart';
import '../constants/app_constant.dart';
import '../helper/responsive_helper.dart';


class DefaultTextTheme {
  static const double spacing = 0;

  static TextStyle primaryLabel(
      {Color? color, double? size, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: size ?? 36,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontFamily: AppAssets.gilroyBoldFont,
      color: color ?? blueTextColor,
    );
  }

  static TextStyle appBarTitle({Color? color, double? fontSize}) {
    bool isWeb = Get.size.shortestSide > AppConstants.mediumScreenSize;
    return TextStyle(
      fontSize: isWeb ? fontSize ?? 24 : fontSize ?? 18,
      fontWeight: FontWeight.w600,
      fontFamily: AppAssets.gilroyBoldFont,
      color: color ?? textBlack,
      letterSpacing: 1,
    );
  }

  static TextStyle ternaryLabel(
      {Color? color, double? size, bool underline = false}) {
    return TextStyle(
      fontSize: size ?? 14,
      fontWeight: FontWeight.w400,
      fontFamily: AppAssets.gilroyMediumFont,
      color: color ?? grey,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle dialogLabel(
      {Color? color, double? size, bool underline = false}) {
    return TextStyle(
      fontSize: 12,
      fontFamily: AppAssets.gilroyBoldFont,
      color: color ?? textBlack,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle secondaryLabel(
      {Color? color,
      double? size,
      bool underline = false,
      FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontFamily: AppAssets.gilroyFont,
      color: color ?? blueTextColor,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle dialogMedium(
      {Color? color, double? size, bool underline = false}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: AppAssets.gilroyMediumFont,
      color: color ?? textBlack,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  //Size 36
  static TextStyle headline1Bold(BuildContext context, {Color? color, double? size}) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: FontWeight.w800,
      // Bold
      fontSize: size?? 36,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle headline1(BuildContext context, {Color? color}) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: FontWeight.w600,
      fontSize: 36,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  // Headline 2: Regular 400
  // static TextStyle headline2(BuildContext context, {Color? color}) {
  //   return  TextStyle(
  //     // fontFamily: AppAssets.plusJakartaSans,
  //     fontWeight: FontWeight.w400,
  //     // Regular
  //     fontSize: 36,
  //     color: color ?? textBlack,
  //     letterSpacing: spacing,
  //   );
  // }

  // Headline 3: Medium 500

  //Size 32

  static TextStyle headline2(
    BuildContext context, {
    Color? color,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: FontWeight.w600,
      // Medium
      fontSize: Responsive.isSmallMobile(context) ? 25 : 32,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle headline2Bold(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: Responsive.isSmallMobile(context) ? 25 : 32,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  //Size 28
  static TextStyle headline3Bold(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // SemiBold
      fontSize: 28,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle headline3(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // SemiBold
      fontSize: 28,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  //Size 26
  static TextStyle headline4Bold(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // SemiBold
      fontSize: 28,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle headline4(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // SemiBold
      fontSize: 28,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  //Size 24
  static TextStyle headline5Bold(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // SemiBold
      fontSize: 24,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle headline5(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // SemiBold
      fontSize: 24,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  //Size 22

  static TextStyle headline6Bold(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // SemiBold
      fontSize: 22,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle headline6(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // SemiBold
      fontSize: 22,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  //Size 20
  static TextStyle headline7Bold(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w800,
    double? letterSpacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Bold
      fontSize: Responsive.isSmallMobile(context) ? 15 : 20,
      color: color ?? textBlack,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle headline7(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
    double? letterSpacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Bold
      fontSize: Responsive.isSmallMobile(context) ? 15 : 20,
      color: color ?? textBlack,
      letterSpacing: letterSpacing,
    );
  }

  //Size 18
  static TextStyle headline8Bold(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w800,
    double? letterSpacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: 18,
      color: color ?? textBlack,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle headline8(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
    double? letterSpacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: 18,
      color: color ?? textBlack,
      letterSpacing: letterSpacing,
    );
  }

  //Size 16
  static TextStyle headline9Bold(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: 16,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle headline9(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: 16,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  //Size 15
  static TextStyle headline10Bold(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: 15,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle headline10(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: 15,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  //Size 14
  static TextStyle bodyText1(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow? overflow,
    double? laterSpacing,
    double? fontSize,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: fontSize ?? 14,
      overflow: overflow,
      color: color ?? textBlack,
      letterSpacing: laterSpacing ?? 0,
    );
  } //Size 13

  static TextStyle bodyText4(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
    TextOverflow? overflow,
    double? laterSpacing,
    double? fontSize,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: fontSize ?? 13,
      overflow: overflow,
      color: color ?? textBlack,
      letterSpacing: laterSpacing ?? 0,
    );
  }

  // static TextStyle headline8(
  //   BuildContext context, {
  //   Color? color,
  //   FontWeight fontWeight = FontWeight.w600,
  // }) {
  //   return TextStyle(
  //     // fontFamily: AppAssets.plusJakartaSans,
  //     // SemiBold font
  //     fontWeight: fontWeight,
  //     fontSize: 20,
  //     color: color ?? textBlack,
  //     //: 40,
  //     letterSpacing: spacing,
  //   );
  // }
  //
  // static TextStyle headline9(
  //   BuildContext context, {
  //   Color? color,
  //   FontWeight fontWeight = FontWeight.w600,
  // }) {
  //   return TextStyle(
  //     // fontFamily: AppAssets.plusJakartaSans,
  //     // SemiBold font
  //     fontWeight: fontWeight,
  //     fontSize: 22,
  //     color: color ?? textBlack,
  //     //: 40,
  //     letterSpacing: spacing,
  //   );
  // }

  // static TextStyle headline4(
  //   BuildContext context, {
  //   Color? color,
  //   FontWeight fontWeight = FontWeight.w600,
  // }) {
  //   return TextStyle(
  //     // fontFamily: AppAssets.plusJakartaSans,
  //     // SemiBold font
  //     fontWeight: fontWeight,
  //     fontSize: 26,
  //     color: color ?? textBlack,
  //     //: 40,
  //     letterSpacing: spacing,
  //   );
  // }
  //
  // static TextStyle headline7(
  //   BuildContext context, {
  //   Color? color,
  //   FontWeight? fontWeight = FontWeight.w700,
  // }) {
  //   return TextStyle(
  //     // fontFamily: AppAssets.plusJakartaSans,
  //     // Bold font
  //     fontWeight: fontWeight,
  //     fontSize: Responsive.isSmallMobile(context) ? 15 : 16,
  //     color: color ?? textBlack,
  //     letterSpacing: spacing,
  //   );
  // }

  // Body Text 2: Bold 700
  static TextStyle bodyText2(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w800,
      // Bold
      fontSize: 14,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle bodyText3(BuildContext context,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w500,
      // Bold
      fontSize: 13,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  //Size 12
  static TextStyle subtitle1(
    BuildContext context, {
    double? size,
    Color? color,
    TextOverflow? overflow,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize:  size ?? 13,
      overflow: overflow,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle subtitle2(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w800,
      // Bold
      fontSize: 12,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle subtitle500(
    BuildContext context, {
    double? size,
    Color? color,
    TextOverflow? overflow,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Medium
      fontSize: Responsive.isSmallMobile(context) ? 10 : size ?? 12,
      overflow: overflow,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  // Subtitle Underline
  // Size 12
  static TextStyle subtitleUnder(
    BuildContext context, {
    Color? color,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight,
      // Bold
      fontSize: 12,
      color: color ?? textBlack,
      decoration: TextDecoration.underline,
      letterSpacing: spacing,
    );
  }

  // Size 11
  static TextStyle captionLarge(
    BuildContext context, {
    double? height,
    Color? color,
    FontWeight? fontWeight,
    double? spacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w600,
      // Medium
      fontSize: 11,
      color: color ?? textBlack,
      letterSpacing: spacing ?? spacing,
      height: height ?? 0,
    );
  }

  static TextStyle captionLarge500(
    BuildContext context, {
    double? height,
    Color? color,
    FontWeight? fontWeight,
    double? spacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w500,
      // Medium
      fontSize: 11,
      color: color ?? textBlack,
      letterSpacing: spacing ?? spacing,
      height: height ?? 0,
    );
  }

  static TextStyle captionLarge2(
    BuildContext context, {
    double? height,
    Color? color,
    FontWeight? fontWeight,
    double? spacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w700,
      // Medium
      fontSize: 11,
      color: color ?? textBlack,
      letterSpacing: spacing ?? spacing,
      height: height ?? 0,
    );
  }

  // Size 10
  static TextStyle caption(
    BuildContext context, {
    double? height,
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    double? spacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w600,
      // Medium
      fontSize: 10,
      color: color ?? textBlack,
      letterSpacing: spacing ?? spacing,
      height: height ?? 0,
      overflow: overflow,
    );
  }

  static TextStyle caption500(
    BuildContext context, {
    double? height,
    Color? color,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    double? spacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w500,
      // Medium
      fontSize: 10,
      color: color ?? textBlack,
      letterSpacing: spacing ?? spacing,
      height: height ?? 0,
      overflow: overflow,
    );
  }

  static TextStyle caption2(
    BuildContext context, {
    double? height,
    Color? color,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: FontWeight.w700,
      // Bold
      fontSize: 10,
      color: color ?? textBlack,
      letterSpacing: spacing,
      height: height ?? 0,
    );
  }

  // Caption Underline
  // Size 10
  static TextStyle captionUnderline(BuildContext context,
      {Color? color, FontWeight? fontWeight, double? size}) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w500,
      // Medium
      fontSize: size ?? 10,
      color: color ?? textBlack,
      decoration: TextDecoration.underline,
      letterSpacing: spacing,
    );
  }

  // Size 9
  static TextStyle captionMedium(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w600,
      // Medium
      fontSize: 9,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle captionMedium2(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w800,
      // Medium
      fontSize: 9,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle captionMedium500(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w500,
      // Medium
      fontSize: 9,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  // Size 8
  static TextStyle captionSmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w600,
      // Medium
      fontSize: 8,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle captionSmall2(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w800,
      // Medium
      fontSize: 8,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  // caption: Bold 700
  static TextStyle overline(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w700,
      // Bold
      fontSize: Responsive.isMobile(context) ? 8 : 10,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  static TextStyle overlineSmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w800,
      // Bold
      fontSize: 8,
      color: color ?? textBlack,
      letterSpacing: spacing,
    );
  }

  // Table Title Text
  static TextStyle tableTitleText({
    Color? color,
    double? size,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w600,
      // Bold
      fontSize: size ?? 11.0,
      color: color ?? mediumBlack,
      decoration: TextDecoration.none,
    );
  }

  // Table Data Text Normal
  static TextStyle tableDataTextNormal({
    double? height,
    Color? color,
    FontWeight? fontWeight,
    double? spacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w600,
      // Medium
      fontSize: 10,
      color: color ?? tabelTxtColor,
      letterSpacing: spacing ?? spacing,
      height: height ?? 0,
    );
  }

  static TextStyle tableTitleTextMobile({
    Color? color,
    double? size,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w700,
      // Bold
      fontSize: size ?? 12.0,
      color: color ?? tabelTitleBlack,
      decoration: TextDecoration.none,
    );
  }

  // Table Data Text Normal
  static TextStyle tableDataTextNormalMobile({
    double? height,
    Color? color,
    FontWeight? fontWeight,
    double? spacing,
  }) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontWeight ?? FontWeight.w600,
      // Medium
      fontSize: 11,
      color: color ?? tabelTxtColor,
      letterSpacing: spacing ?? spacing,
      height: height ?? 0,
    );
  }

  static TextStyle drawerItems(BuildContext context,
      {Color? color, FontWeight? fontweight, double? size}) {
    return TextStyle(
      // fontFamily: AppAssets.plusJakartaSans,
      fontWeight: fontweight ?? FontWeight.w700,
      color: color ?? textBlack,
      fontSize: Responsive.isMobile(context) ? 10 : size ?? 9,
    );
  }
}
