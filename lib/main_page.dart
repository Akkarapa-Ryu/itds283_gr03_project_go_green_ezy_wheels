import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'pages/pages.dart';
import 'theme/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  final List _pageWidget = [
    const HomePage(),
    const CarListPage(),
    const SettingPage()
  ];
  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 35,
        ),
        label: MainMessage.home),
    const BottomNavigationBarItem(
        icon: Icon(
          IconData(0xe1d7, fontFamily: DesignSystem.fontIcon_MaterialIcons),
          size: 35,
        ),
        label: MainMessage.car),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings_outlined,
          size: 35,
        ),
        label: MainMessage.setting),
  ];

  _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(currentPageIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _onItemTapped(index),
        selectedItemColor: DesignSystem.c6,
        backgroundColor: DesignSystem.c1,
        currentIndex: currentPageIndex,
        items: _menuBar,
      ),
    );
  }
}
