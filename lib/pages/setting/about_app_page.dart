import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../constants/constants.dart';
import '../../theme/theme.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textContainer(
            SettingMessage.aboutUs, DesignSystem.c0, FontWeight.bold, null),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textContainer(
                'Mahidol University', DesignSystem.c0, FontWeight.w500, 24),
            SizedBox(
              height: 25,
            ),
            textContainer('Faculty of', DesignSystem.c0, FontWeight.w500, 16),
            textContainer('Information and Communication Technology',
                DesignSystem.c0, FontWeight.w500, 16),
            SizedBox(
              height: 15,
            ),
            textContainer(
                'Bachelor of Science in', DesignSystem.c0, FontWeight.w500, 16),
            textContainer('Digital Science and Technology : DST',
                DesignSystem.c0, FontWeight.w500, 16),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: DesignSystem.c0,
            ),
            SizedBox(
              height: 30,
            ),
            textContainer('ITDS283 Mobile Application Development',
                DesignSystem.c0, FontWeight.w500, 16),
            SizedBox(
              height: 15,
            ),
            textContainer('This Application Mobile is name', DesignSystem.c0,
                FontWeight.w500, 16),
                textContainer('"Go Green Ezy Wheels"', DesignSystem.c0,
                FontWeight.w500, 16),
            SizedBox(
              height: 15,),
            textContainer('This Application Mobile make by', DesignSystem.c0,
                FontWeight.w500, 16),
            textContainer('6587027 Phatra Wongsapsakul', DesignSystem.c0, FontWeight.w500, 16),
            textContainer('6587045 Akkarapa Tongprasit', DesignSystem.c0, FontWeight.w500, 16),
          ],
        ),
      ),
    );
  }
}
