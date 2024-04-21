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
  final _formKey = GlobalKey<FormState>(); // For form validation
  bool _isObscure = true;

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
      body: Stack(
        children: [
          const Positioned(
                top: -50,
                left: -150,
                child: Icon(
                  IconData(0xf07f8,
                      fontFamily: DesignSystem.fontIconMaterialIcons),
                  size: 450,
                  color: DesignSystem.c14,
                )),
          const Positioned(
            top: 400,
            left: 100,
            child: Icon(
              IconData(0xf6b2, fontFamily: DesignSystem.fontIconMaterialIcons),
              size: 450,
              color: DesignSystem.c14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailSigninController,
                    style: const TextStyle(
                        color: DesignSystem.c0,
                        fontFamily: DesignSystem.fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    decoration: InputDecoration(
                        labelText: SignInMessage.email,
                        labelStyle: const TextStyle(
                            color: DesignSystem.c0,
                            fontFamily: DesignSystem.fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                        hintText: SignInMessage.emailExample,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    keyboardType: TextInputType.emailAddress,
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
                    style: const TextStyle(
                        color: DesignSystem.c0,
                        fontFamily: DesignSystem.fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: SignInMessage.password,
                      labelStyle: const TextStyle(
                          color: DesignSystem.c0,
                          fontFamily: DesignSystem.fontFamily,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return RegisterMessage.passwordPlease;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var _email = emailSigninController.text;
                      var _password = passwordSigninController.text;

                      if (_formKey.currentState!.validate()) {
                        if (_email.contains('@')) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage(
                                      email: _email, password: _password)));
                        }
                      } else {
                        return;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: DesignSystem.c9,
                        minimumSize: const Size(double.infinity, 50)),
                    child: textContainer(SignInMessage.signIn, DesignSystem.c1,
                        FontWeight.bold, 16),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
