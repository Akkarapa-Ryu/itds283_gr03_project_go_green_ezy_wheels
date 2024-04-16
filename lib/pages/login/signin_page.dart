
import 'package:flutter/material.dart';
import '../../main_page.dart';
import '../../constants/constants.dart';

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
        title: Text('Sign in'),
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
                  decoration: InputDecoration(
                      labelText: RegisterMessage.email,
                      hintText: RegisterMessage.emailExample,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return RegisterMessage.emailPlease;
                    } else if (!value.contains('@')) {
                      return RegisterMessage.emailSymbol;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordSigninController,
                  decoration: InputDecoration(
                      labelText: RegisterMessage.password,
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
                    child: Text("Sign in"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}