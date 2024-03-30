import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
    );
  }
}
