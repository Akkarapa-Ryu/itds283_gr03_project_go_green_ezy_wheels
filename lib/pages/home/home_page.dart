import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/container_text.dart';
import '../../pages/pages.dart';
import '../../constants/constants.dart';
import '../../theme/theme.dart';
import '../../components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.data,
      required this.email,
      required this.password});
  final List data;
  final String email;
  final String password;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<QueryDocumentSnapshot> carsList = [];

  getDate() async {
    QuerySnapshot querySnapshotCarList =
        await FirebaseFirestore.instance.collection('cars').get();

    carsList.addAll(querySnapshotCarList.docs);
    setState(() {});
  }

  @override
  void initState() {
    getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textContainer(
                      HomeMessage.hello, DesignSystem.c0, FontWeight.w600, 20),
                  const SizedBox(
                    height: 15,
                  ),
                  textContainer(
                      "${widget.data.first.data()["fname"]} ${widget.data.first.data()["lname"]}",
                      DesignSystem.c0,
                      FontWeight.w600,
                      26),
                  const SizedBox(
                    height: 15,
                  ),
                  textContainer("${widget.data.first.data()["email"]}",
                      DesignSystem.c0, FontWeight.normal, 14),
                ],
              ),
            ),
            Container(
              height: 550,
              decoration: BoxDecoration(
                  color: DesignSystem.c4,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeMenuButton(
                        iconMenu: Icon(IconData(0xee2d,
                            fontFamily: DesignSystem.fontIconMaterialIcons)),
                        text: HomeMessage.hour,
                      ),
                      HomeMenuButton(
                        iconMenu: Icon(Icons.sunny),
                        text: HomeMessage.day,
                        routePage: CarListDayPage(
                          data: widget.data,
                        ),
                      ),
                      HomeMenuButton(
                        iconMenu: Icon(Icons.calendar_month),
                        text: HomeMessage.longTerm,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HomeMenuButton(
                        iconMenu: Icon(Icons.charging_station),
                        text: HomeMessage.evCharger,
                        routePage: EvChargerPage(),
                      ),
                      HomeMenuButton(
                        iconMenu: Icon(Icons.car_rental),
                        text: HomeMessage.vanWithDriver,
                      ),
                      HomeMenuButton(
                        iconMenu: Icon(Icons.car_repair_sharp),
                        text: HomeMessage.premiumCarWithDriver,
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
