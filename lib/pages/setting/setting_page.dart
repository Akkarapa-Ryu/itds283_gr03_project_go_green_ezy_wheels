import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';
import '../../constants/constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
                Text(
                  SettingMessage.setting,
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Albert Forests',
                    style: TextStyle(
                        fontFamily: DesignSystem.fontFamily,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                        Text('Email Albert Forests',
                    style: TextStyle(
                        fontFamily: DesignSystem.fontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
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
                    iconSetting: Icon(IonIcons.chatbox_ellipses)),
                SizedBox(
                  height: 180,
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
