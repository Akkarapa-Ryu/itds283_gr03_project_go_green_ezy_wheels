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

  /*
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
  }*/



  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      home: Scaffold(
        body: _pageWidget.elementAt(currentPageIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _onItemTapped(index),
          selectedItemColor: DesignSystem.c6,
          backgroundColor: DesignSystem.c1,
          currentIndex: currentPageIndex,
          items: _menuBar,
        ),
      ),
    );*/
    return MaterialApp(
        home: LandingPage()
        // PageView(
        //   controller: PageController(viewportFraction: 1),
        //   onPageChanged: (index) => setState(() {
        //     _currentPageIndex = index;
        //   }),
        //   children: [LandingPage(),WelcomePage()],
        // ),
        );
  }
}
