import 'package:flutter/material.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/theme/design_system.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.colorButton,
      required this.heightSizeButton,
      required this.widthSizeButton,
      this.routePage,
      required this.textButton,
      required this.colorText,
      required this.textSize,
      required this.textWeight, 
      this.borderRadius, 
      });
  final Color colorButton;
  final double heightSizeButton;
  final double widthSizeButton;
  final Widget? routePage;
  final String textButton;
  final Color colorText;
  final double textSize;
  final FontWeight textWeight;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                // RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                borderRadiusSize(borderRadius),
            backgroundColor: colorButton,
            // minimumSize: Size.fromHeight(heightSizeButton),
          ),
          onPressed: () {
            if (routePage != null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => routePage!));
            } else {
              // print('Not Found');
              return;
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: heightSizeButton,
            width: widthSizeButton,
            child: Text(
              textButton,
              style: TextStyle(
                  color: colorText,
                  fontFamily: DesignSystem.fontFamily,
                  fontWeight: textWeight,
                  fontSize: textSize),
            ),
          )),
    );
  }

    borderRadiusSize(borderRadius){
    if (borderRadius != null) {
     return RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!));
    }else{
     return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
    }
  }
}
