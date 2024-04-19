import 'package:flutter/material.dart';
import '../../theme/theme.dart';

textContainer(String text, Color colorText, FontWeight fontWeight,double? fontSize) {
  if (fontSize != null) {
    return Text(text,
      style: TextStyle(
          color: colorText,
          fontFamily: DesignSystem.fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize));
  } else {
    return Text(text,
      style: TextStyle(
          color: colorText,
          fontFamily: DesignSystem.fontFamily,
          fontWeight: fontWeight));
  }
}
