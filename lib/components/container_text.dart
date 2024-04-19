import 'package:flutter/material.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/theme/theme.dart';

textContainer(String text, Color colorText, FontWeight fontWeight,double fontSize) {
  return Text(text,
      style: TextStyle(
          color: colorText,
          fontFamily: DesignSystem.fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize));
}
