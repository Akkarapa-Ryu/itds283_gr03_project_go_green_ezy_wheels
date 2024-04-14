import 'package:flutter/material.dart';
import '../../main_page.dart';
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
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      height: 110,
                      width: 110,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    LoginMessage.ggew,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: DesignSystem.c1,
                        fontFamily: DesignSystem.fontFamily),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    LoginMessage.beginMessage,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: DesignSystem.c1,
                        fontFamily: DesignSystem.fontFamily),
                  ),
                  SizedBox(height: 55.0),
                  CustomButton(
                    routePage: MainPage(),
                      colorButton: DesignSystem.c1,
                      textButton: LoginMessage.phoneSigin,
                      textWeight: FontWeight.w600,
                      sizeButtonHeight: 50,
                      sizeButtonWidth: 275,),
                  const SizedBox(height: 10.0),
                  CustomButton(
                      iconWidget: Image.asset(
                        'assets/images/google.jpg',
                        height: 24.0,
                        width: 24.0,
                      ),
                      colorButton: DesignSystem.c1,
                      textButton: LoginMessage.googleSigin,
                      textWeight: FontWeight.w600, sizeButtonHeight: 0, sizeButtonWidth: 0,),
                  const SizedBox(height: 10.0),
                  CustomButton(
                      iconWidget: Image.asset(
                        'assets/images/facebook.jpg',
                        height: 24.0,
                        width: 24.0,
                      ),
                      colorButton: DesignSystem.c1,
                      textButton: LoginMessage.googleSigin,
                      textWeight: FontWeight.w600, sizeButtonHeight: 0, sizeButtonWidth: 0,),
                  SizedBox(height: 40.0),
                  Text(
                    LoginMessage.alreadyMessage,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: DesignSystem.c1,
                        fontFamily: DesignSystem.fontFamily),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(LoginMessage.sigin),
                    style: TextButton.styleFrom(
                      foregroundColor: DesignSystem.c9,
                      textStyle: TextStyle(
                          fontSize: 16.0, fontFamily: DesignSystem.fontFamily),
                    ),
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
