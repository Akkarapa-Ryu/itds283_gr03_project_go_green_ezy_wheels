import 'package:flutter/material.dart';
import '../../components/container_text.dart';
import '../../pages/pages.dart';
import '../../components/components.dart';
import '../../constants/constants.dart';
import '../../theme/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            // Background image
            Image.asset(
              'assets/images/background1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/logo.png',
                      // height: 110,
                      // width: 110,
                      // color: DesignSystem.c1,
                    ),
                  ),
                  SizedBox(height: 10),
                  textContainer(
                      LoginMessage.ggew, DesignSystem.c1, FontWeight.bold, 24),
                  SizedBox(height: 10.0),
                  textContainer(
                      LoginMessage.beginMessage, DesignSystem.c1, FontWeight.normal, 18),
                  SizedBox(height: 55.0),
                  CustomButton(
                    routePage: RegisterPage(),
                    colorButton: DesignSystem.c1,
                    textButton: LoginMessage.phoneSigin,
                    textWeight: FontWeight.w600,
                    sizeButtonHeight: 50,
                    sizeButtonWidth: 275,
                  ),
                  const SizedBox(height: 10.0),
                  CustomButton(
                    iconWidget: Image.asset(
                      'assets/images/google.jpg',
                      height: 24.0,
                      width: 24.0,
                    ),
                    colorButton: DesignSystem.c1,
                    textButton: LoginMessage.googleSigin,
                    textWeight: FontWeight.w600,
                    sizeButtonHeight: 0,
                    sizeButtonWidth: 0,
                  ),
                  const SizedBox(height: 10.0),
                  CustomButton(
                    iconWidget: Image.asset(
                      'assets/images/facebook.jpg',
                      height: 24.0,
                      width: 24.0,
                    ),
                    colorButton: DesignSystem.c1,
                    textButton: LoginMessage.googleSigin,
                    textWeight: FontWeight.w600,
                    sizeButtonHeight: 0,
                    sizeButtonWidth: 0,
                  ),
                  SizedBox(height: 40.0),
                  textContainer(
                      LoginMessage.alreadyMessage, DesignSystem.c1, FontWeight.w500, 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SigninPage()));
                    },
                    child: textContainer(
                      LoginMessage.sigin, DesignSystem.c9, FontWeight.bold, 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
