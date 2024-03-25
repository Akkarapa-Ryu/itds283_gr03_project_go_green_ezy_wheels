import 'package:flutter/material.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/theme/design_system.dart';

class HomeMenuButton extends StatelessWidget {
  const HomeMenuButton({super.key, required this.iconMenu, required this.text});

  final Icon iconMenu;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 85,
          width: 85,
          decoration: BoxDecoration(
              color: DesignSystem.c1,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: 
          Icon(
            iconMenu.icon,
            size: 65,
            color: DesignSystem.c6,
          ),
          // iconMenu
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 100,
          child: Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontFamily: DesignSystem.fontFamily,
                fontSize: 15,
                color: DesignSystem.c1,
                shadows: [
                  Shadow(
                      color: DesignSystem.disable,
                      blurRadius: 1,
                      offset: Offset(1, 1))
                ]),
          ),
        )
      ],
    );
  }
}
