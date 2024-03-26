import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '/pages/pages.dart';
import '/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GGEWTheme.light,
      // darkTheme: GGEWTheme.dark,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: <Widget>[
          HomePage(),
          CarListPage(),
          SettingPage()
        ][currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedItemColor: DesignSystem.c6,
          backgroundColor: DesignSystem.c1,
          currentIndex: currentPageIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 35,), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.car_crash,size: 35,), label: 'Car'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined,size: 35,), label: 'Setting'),
          ],
        ),
      ),
    );
  }
}
