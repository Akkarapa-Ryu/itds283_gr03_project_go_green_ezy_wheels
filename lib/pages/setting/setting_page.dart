import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Setting',
            style: TextStyle(
                fontFamily: DesignSystem.fontFamily,
                fontWeight: FontWeight.w700),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: DesignSystem.c4,
              shadowColor: DesignSystem.disable,
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: DesignSystem.c4,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi !!!',
                          style: TextStyle(
                              fontFamily: DesignSystem.fontFamily,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Albert Flores',
                            style: TextStyle(
                                fontFamily: DesignSystem.fontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-photo/portrait-handsome-young-man_53876-38137.jpg?size=626&ext=jpg&ga=GA1.1.735520172.1711238400&semt=ais'),
                    )
                  ],
                )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SettingMenuButton(
                textButtonSetting: 'Edit Profile',
                iconSetting: Icon(Icons.person)),
            SettingMenuButton(
                textButtonSetting: 'Change Password',
                iconSetting: Icon(IonIcons.finger_print)),
            SettingMenuButton(
                textButtonSetting: 'Bank Account',
                iconSetting: Icon(Icons.currency_bitcoin)),
            SettingMenuButton(
                textButtonSetting: 'Information',
                iconSetting: Icon(IonIcons.chatbox_ellipses)),
            SizedBox(
              height: 150,
            ),
            Card(
              color: DesignSystem.c7,
              shadowColor: DesignSystem.disable,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: Text('Sign out',style: TextStyle(
                    fontSize: 25,
                    fontFamily: DesignSystem.fontFamily,
                    fontWeight: FontWeight.w600),),
                decoration: BoxDecoration(
                  color: DesignSystem.c7,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
