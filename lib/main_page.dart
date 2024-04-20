import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/components.dart';
import 'constants/constants.dart';
import 'pages/pages.dart';
import 'theme/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.email, required this.password});
  final String email;
  final String password;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;

  intiaData() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    QuerySnapshot userData =
        await users.where("email", isEqualTo: widget.email).get();

    for (var element in userData.docs) {
      if (element["password"] == widget.password) {
        data.add(element);
        // return true;
      } else {
        print("FALSE FETCHING DATA");
        // return false;
      }
    }
    // print('DATA of data Fetch: ${data.first.data()} -> ${data.runtimeType}');
    setState(() {});
    isLoading = false;
  }

  int currentPageIndex = 0;

  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 35,
        ),
        label: MainMessage.home),
    const BottomNavigationBarItem(
        icon: Icon(
          IconData(0xf6b2, fontFamily: DesignSystem.fontIconMaterialIcons),
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

// https://stackoverflow.com/questions/56073366/flutter-send-params-in-bottom-navigation-bar
  List<Widget> _pageWidget() => [
        HomePage(data: data, email: widget.email, password: widget.password),
        CarListPage(data: data, email: widget.email, password: widget.password),
        SettingPage(data: data, email: widget.email, password: widget.password)
      ];

  @override
  void initState() {
    // getData();
    intiaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageWidget = _pageWidget();

    if (data.isNotEmpty) {
      return Scaffold(
        body: isLoading == true
            ? Center(
                child: textContainer(
                    MainMessage.loading, DesignSystem.c0, FontWeight.bold, 20),
              )
            : pageWidget[currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _onItemTapped(index),
          selectedItemColor: DesignSystem.c6,
          backgroundColor: DesignSystem.c1,
          currentIndex: currentPageIndex,
          items: _menuBar,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: textContainer(
              MainMessage.signIn, DesignSystem.c0, FontWeight.bold, null),
          centerTitle: true,
        ),
        body: isLoading == true
            ? Center(
                child: textContainer(
                    MainMessage.loading, DesignSystem.c0, FontWeight.bold, 20),
              )
            : Center(
                child: textContainer(
                    MainMessage.notFound, DesignSystem.c0, FontWeight.bold, 28),
              ),
      );
    }
  }
}
