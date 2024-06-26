import 'package:flutter/material.dart';
import '../../pages/pages.dart';
import '../../components/components.dart';
import '/constants/constants.dart';
import '/theme/theme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.fitWidth,
            width: double.maxFinite,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 17),
            width: 180,
            height: 5,
            decoration: const BoxDecoration(
                color: DesignSystem.c8,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 17, right: 17, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textContainer(WelcomeMessage.welcome, DesignSystem.c0,
                    FontWeight.bold, 30),
                SizedBox(height: 20),
                textContainer(WelcomeMessage.ggewMessage, DesignSystem.c0,
                    FontWeight.normal, 16),
                const SizedBox(
                  height: 220,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CustomButton(
                routePage: LoginPage(),
                colorButton: DesignSystem.c2,
                sizeButtonHeight: 50,
                textButton: WelcomeMessage.next,
                colorText: DesignSystem.c0,
                textSize: 18,
                textWeight: FontWeight.w600,
                sizeButtonWidth: double.infinity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
