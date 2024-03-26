import 'package:flutter/material.dart';

import '../theme/theme.dart';

class SettingMenuButton extends StatelessWidget {
  const SettingMenuButton(
      {super.key, required this.textButtonSetting, required this.iconSetting});

  final String textButtonSetting;
  final Icon iconSetting;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DesignSystem.c1,
      shadowColor: DesignSystem.c0,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: DesignSystem.c1),
        child: Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: DesignSystem.c6,
              child: Icon(iconSetting.icon, size: 30,),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              textButtonSetting,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: DesignSystem.fontFamily,
                  fontWeight: FontWeight.w500),
            )
          ],
        )),
      ),
    );
  }
}
