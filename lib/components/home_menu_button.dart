import 'package:flutter/material.dart';
import '.../../../theme/theme.dart';

class HomeMenuButton extends StatelessWidget {
  const HomeMenuButton(
      {super.key, required this.iconMenu, required this.text, this.routePage});

  final Icon iconMenu;
  final String text;
  final Widget? routePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Column(
        children: [
          TextButton(
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
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                  color: DesignSystem.c1,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: iconColor(iconMenu, routePage),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
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
      ),
    );
  }

  iconColor(Icon iconMenu, Widget? routePage) {
    if (routePage == null) {
      return Icon(
        iconMenu.icon,
        size: 65,
        color: DesignSystem.disable,
      );
    } else {
      return Icon(iconMenu.icon, size: 65, color: DesignSystem.c6);
    }
  }
}
