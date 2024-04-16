import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'pages/pages.dart';
import 'theme/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage(
      {super.key,
      // required this.id,
      // required this.phone,
      // required this.fname,
      // required this.lname,
      required this.email,
      required this.password});
  // final String id;
  // final String phone;
  // final String fname;
  // final String lname;
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
      if (element.exists) {
        // final userOfData = element.data();
        if (element["password"] == widget.password) {
          data.add(element);
          // print('DATA From Firebase: ${element.id}');
          // print('DATA User Password: ${element["password"]}');
          return true;
        } else {
          // print('Not Found');
          return false;
        }
      } else {
        // print('Bye bye...');
        return false;
      }
    }
    // print('DATA of data Fetch: ${data.first.data()} -> ${data.runtimeType}');
    setState(() {});
    isLoading = false;
  }

  int currentPageIndex = 0;

  // final List _pageWidget = [
  //   HomePage(
  //     data: data,
  //     //     // phone: phone,
  //     //     // fname: fname,
  //     //     // lname: lname,
  //     //     // email: email,
  //     //     // password: password
  //   ),
  //   const CarListPage(),
  //   const SettingPage()
  // ];

  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 35,
        ),
        label: MainMessage.home),
    const BottomNavigationBarItem(
        icon: Icon(
          IconData(0xe1d7, fontFamily: DesignSystem.fontIconMaterialIcons),
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
        HomePage(
            data: data,
            // phone: phone,
            // fname: fname,
            // lname: lname,
            email: widget.email,
            password: widget.password),
        const CarListPage(),
        const SettingPage()
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
                child: Text('Loading ...'),
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
          title: Text("Sign in"),
        ),
        body: isLoading == true
            ? Center(
                child: Text('Loading ...'),
              )
            : Center(
                child: Text(
                  "Not Found",
                  style: TextStyle(fontSize: 28),
                ),
              ),
      );
    }
  }
}
