import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/pages/pages.dart';
import '/theme/theme.dart';
import '/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MainMessage.itds283Pjgr03,
      theme: GGEWTheme.light,
      // darkTheme: GGEWTheme.dark,
      home: const MyHomePage(title: MainMessage.goGreenEzyWheels),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LandingPage(),
        );
  }
}
