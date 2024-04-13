import 'package:flutter/material.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/theme/design_system.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.colorButton,
      required this.sizeButton,
      this.routePage,
      required this.textButton,
      required this.colorText,
      required this.textSize,
      required this.textWeight});
  final Color colorButton;
  final double sizeButton;
  final Widget? routePage;
  final String textButton;
  final Color colorText;
  final double textSize;
  final FontWeight textWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: colorButton,
            minimumSize: Size.fromHeight(sizeButton),
          ),
          onPressed: () {
            if (routePage != null) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => routePage!));
            } else {
              print('Not Found');
              return;
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
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
}
