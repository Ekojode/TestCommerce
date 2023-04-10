import 'package:flutter/material.dart';
import 'dimension_utils.dart';

class AppTextStyle {
  static TextStyle regularText32(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w400, fontSize: 32, context: context);
  static TextStyle regularText28(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w400, fontSize: 28, context: context);
  static TextStyle regularText24(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w400, fontSize: 24, context: context);
  static TextStyle regularText20(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w400, fontSize: 20, context: context);
  static TextStyle regularText16(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w400, fontSize: 16, context: context);
  static TextStyle regularText14(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w400, fontSize: 14, context: context);
  static TextStyle regularText12(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w400, fontSize: 12, context: context);
  static TextStyle regularText10(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w400, fontSize: 10, context: context);
  static TextStyle regularText8(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w400, fontSize: 8, context: context);

  static TextStyle mediumText32(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w500, fontSize: 32, context: context);
  static TextStyle mediumText28(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w500, fontSize: 28, context: context);
  static TextStyle mediumText24(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w500, fontSize: 24, context: context);
  static TextStyle mediumText20(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w500, fontSize: 20, context: context);
  static TextStyle mediumText16(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w500, fontSize: 16, context: context);
  static TextStyle mediumText14(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w500, fontSize: 14, context: context);
  static TextStyle mediumText12(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w500, fontSize: 12, context: context);
  static TextStyle mediumText10(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w500, fontSize: 10, context: context);
  static TextStyle mediumText8(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w500, fontSize: 8, context: context);

  static TextStyle boldText32(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w700, fontSize: 32, context: context);
  static TextStyle boldText28(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w700, fontSize: 28, context: context);
  static TextStyle boldText24(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w700, fontSize: 24, context: context);
  static TextStyle boldText20(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w700, fontSize: 20, context: context);
  static TextStyle boldText16(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w700, fontSize: 16, context: context);
  static TextStyle boldText14(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w700, fontSize: 14, context: context);
  static TextStyle boldText12(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w700, fontSize: 12, context: context);
  static TextStyle boldText10(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w700, fontSize: 10, context: context);
  static TextStyle boldText8(BuildContext context) =>
      appTextStyle(fontWeight: FontWeight.w700, fontSize: 8, context: context);
}

TextStyle appTextStyle(
    {required FontWeight fontWeight,
    required double fontSize,
    required BuildContext context}) {
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: AppDimensions.calculateTextSize(context, fontSize),
    fontStyle: FontStyle.normal,
  );
}
