import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/container_text.dart';
import '../../pages/pages.dart';
import '../../models/models.dart';
import '../../constants/constants.dart';
import '../../theme/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  bool _isObscure = true; // for hiding password

  // TextEditingController
  final phoneController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final querySnapshotUser = FirebaseFirestore.instance.collection('users');

  Future createUser(
      {required String phone,
      required String fname,
      required String lname,
      required String email,
      required String password}) async {
    if (_formKey.currentState!.validate()) {
      // Process form data (e.g., send to server)
      final querySnapshotUserDoc = querySnapshotUser.doc();
      final user = User(
          id: querySnapshotUserDoc.id,
          phone: phone,
          fname: fname,
          lname: lname,
          email: email,
          password: password);
      final json = user.toJson();
      querySnapshotUserDoc.set(json);

      print("Email: $email, Password: $password");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          ModalRoute.withName("/"));
    } else {
      print("Form validation failed!");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Register'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: textContainer(
              RegisterMessage.register, DesignSystem.c0, FontWeight.bold, 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                textContainer(RegisterMessage.pleassMassage, DesignSystem.c0,
                    FontWeight.normal, 16),
                const SizedBox(height: 25.0),
                TextFormField(
                  controller: phoneController,
                  style: TextStyle(
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  decoration: InputDecoration(
                    labelText: RegisterMessage.phoneNumber,
                    labelStyle: TextStyle(
                        color: DesignSystem.c0,
                        fontFamily: DesignSystem.fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    prefix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/TH.jpg',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 0.1),
                        textContainer('  ${RegisterMessage.plus66}  ',
                            DesignSystem.c0, FontWeight.normal, 16),
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType:
                      TextInputType.phone, // Set keyboard type to phone
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return RegisterMessage.phonePlease;
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return RegisterMessage.phonePleaseValid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 45.0),
                TextFormField(
                  controller: fnameController,
                  style: TextStyle(
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  decoration: InputDecoration(
                    labelText: RegisterMessage.firstName,
                    labelStyle: TextStyle(
                        color: DesignSystem.c0,
                        fontFamily: DesignSystem.fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return RegisterMessage.firstNamePlease;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 45.0),
                TextFormField(
                  controller: lnameController,
                  style: TextStyle(
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  decoration: InputDecoration(
                    labelText: RegisterMessage.lastName,
                    labelStyle: TextStyle(
                        color: DesignSystem.c0,
                        fontFamily: DesignSystem.fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return RegisterMessage.lastNamePlease;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 45.0),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  decoration: InputDecoration(
                    labelText: RegisterMessage.email,
                    labelStyle: TextStyle(
                        color: DesignSystem.c0,
                        fontFamily: DesignSystem.fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    hintText: RegisterMessage.emailExample,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return RegisterMessage.emailPlease;
                    } else if (!value.contains('@')) {
                      return RegisterMessage.emailSymbol;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 45.0),
                TextFormField(
                  controller: passwordController,
                  style: TextStyle(
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: RegisterMessage.password,
                    labelStyle: TextStyle(
                        color: DesignSystem.c0,
                        fontFamily: DesignSystem.fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return RegisterMessage.passwordPlease;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 55.0),
                ElevatedButton(
                  onPressed: () {
                    createUser(
                        phone: phoneController.text,
                        fname: fnameController.text,
                        lname: lnameController.text,
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: textContainer(RegisterMessage.signUp,
                      DesignSystem.c1, FontWeight.bold, 16),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: DesignSystem.c9,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
