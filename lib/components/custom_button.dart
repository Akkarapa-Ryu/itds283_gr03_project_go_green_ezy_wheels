import 'package:flutter/material.dart';
import '/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.colorButton,
    required this.sizeButtonHeight,
    required this.sizeButtonWidth,
    this.routePage,
    required this.textButton,
    this.colorText,
    this.textSize,
    required this.textWeight,
    this.iconWidget,
    this.borderRadius,
  });
  final Color colorButton;
  final double sizeButtonHeight;
  final double sizeButtonWidth;
  final Widget? routePage;
  final String textButton;
  final Color? colorText;
  final double? textSize;
  final FontWeight textWeight;
  final double? borderRadius;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    if (iconWidget != null) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton.icon(
          onPressed: () {
            if (routePage != null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => routePage!));
            } else {
              return;
            }
          },
          icon: Container(child: iconWidget),
          label: Text(
            textButton,
            style: TextStyle(
                fontFamily: DesignSystem.fontFamily, fontWeight: textWeight),
          ),
          style: ElevatedButton.styleFrom(
            shape: borderRadiusSize(borderRadius),
            backgroundColor: colorButton,
            surfaceTintColor: colorButton,
            minimumSize: Size(275.0, 50.0),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: borderRadiusSize(borderRadius),
            backgroundColor: colorButton,
            minimumSize: sizeButton(sizeButtonHeight, sizeButtonWidth)),
        onPressed: () {
          if (routePage != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => routePage!));
          } else {
            return;
          }
        },
        child: Text(
          textButton,
          style: TextStyle(
              color: colorText,
              fontFamily: DesignSystem.fontFamily,
              fontWeight: textWeight,
              fontSize: textSize),
        ),
      ),
    );
  }

  borderRadiusSize(borderRadius) {
    if (borderRadius != null) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!));
    } else {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
    }
  }

  sizeButton(sizeButtonHeight, sizeButtonWidth) {
    if (sizeButtonHeight == 0 && sizeButtonWidth == 0) {
      return const Size(275.0, 50.0);
    } else {
      return Size(sizeButtonWidth, sizeButtonHeight);
    }
  }
}
