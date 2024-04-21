import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';
import '../../constants/constants.dart';
import '../pages.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    super.key,
    required this.data,
    required this.email,
    required this.password,
  });
  final List data;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/background1.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                textContainer(SettingMessage.setting, DesignSystem.c0,
                    FontWeight.bold, 24),
                SizedBox(
                  height: 40,
                ),
                textContainer(
                    '${data.first.data()["fname"]}   ${data.first.data()["lname"]}',
                    DesignSystem.c0,
                    FontWeight.bold,
                    35),
                textContainer('Email: ${data.first.data()["email"]}',
                    DesignSystem.c0, FontWeight.normal, 18),
                SizedBox(
                  height: 40,
                ),
                SettingMenuButton(
                    textButtonSetting: SettingMessage.editProfile,
                    iconSetting: Icon(Icons.person)),
                SettingMenuButton(
                    textButtonSetting: SettingMessage.chagePassword,
                    iconSetting: Icon(IonIcons.finger_print)),
                SettingMenuButton(
                    textButtonSetting: SettingMessage.bankAccount,
                    iconSetting: Icon(Icons.currency_bitcoin)),
                SettingMenuButton(
                    textButtonSetting: SettingMessage.information,
                    iconSetting: Icon(
                      IonIcons.chatbox_ellipses,
                    )),
                SettingMenuButton(
                    textButtonSetting: SettingMessage.aboutUs,
                    iconSetting: Icon(
                      IonIcons.information_circle,
                    ),
                    routePage: AboutAppPage()),
                SizedBox(
                  height: 110,
                ),
                CustomButton(
                  colorButton: DesignSystem.c7,
                  sizeButtonHeight: 65,
                  sizeButtonWidth: double.infinity,
                  textButton: SettingMessage.signOut,
                  colorText: DesignSystem.c0,
                  textSize: 25,
                  textWeight: FontWeight.w600,
                  routePageClose: 'close',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
