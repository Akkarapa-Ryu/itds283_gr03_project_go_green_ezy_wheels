import 'package:flutter/material.dart';
import '../../components/container_text.dart';
import '../../main_page.dart';
import '../../constants/constants.dart';
import '../../theme/theme.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailSigninController = TextEditingController();
  final passwordSigninController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textContainer(
            SignInMessage.signIn, DesignSystem.c0, FontWeight.bold, null),
            centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailSigninController,
                  style: TextStyle(
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16
                    ),
                  decoration: InputDecoration(
                      labelText: SignInMessage.email,
                      labelStyle: TextStyle(
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16
                    ),
                      hintText: SignInMessage.emailExample,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return SignInMessage.emailPlease;
                    } else if (!value.contains('@')) {
                      return SignInMessage.emailSymbol;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordSigninController,
                  style: TextStyle(
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16
                    ),
                  decoration: InputDecoration(
                      labelText: SignInMessage.password,
                      labelStyle: TextStyle(
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16
                    ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    var _email = emailSigninController.text;
                    var _password = passwordSigninController.text;

                    if (_email.contains('@')) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainPage(
                                  email: _email, password: _password)));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: DesignSystem.c4,
                      minimumSize: Size(250, 50)),
                  child: textContainer(SignInMessage.signIn, DesignSystem.c1,
                      FontWeight.bold, 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
