import 'package:flutter/material.dart';

import '../theme/theme.dart';

class SettingMenuButton extends StatelessWidget {
  const SettingMenuButton(
      {super.key,
      required this.textButtonSetting,
      required this.iconSetting,
      this.routePage});

  final String textButtonSetting;
  final Icon iconSetting;
  final Widget? routePage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (routePage != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => routePage!));
          } else {
            return;
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: DesignSystem.c1,
            surfaceTintColor: DesignSystem.c1,
            maximumSize: Size(350, 100),
            padding: EdgeInsets.all(10),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            shadowColor: DesignSystem.c0,
            elevation: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: DesignSystem.c6,
              child: Icon(
                iconSetting.icon,
                size: 30,
                color: DesignSystem.c1,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              textButtonSetting,
              style: const TextStyle(
                  color: DesignSystem.c0,
                  fontSize: 20,
                  fontFamily: DesignSystem.fontFamily,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
