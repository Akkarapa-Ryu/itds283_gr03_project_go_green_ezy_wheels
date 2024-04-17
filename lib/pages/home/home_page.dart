import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: 
          Column(children: [
            SizedBox(
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hi !!!',
                        style: TextStyle(
                            fontFamily: DesignSystem.fontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Text("${widget.email}"),
                      // Text("${widget.data.first.data()["email"]}"),
                      Text(
                          "${widget.data.first.data()["fname"]} ${widget.data.first.data()["lname"]}",
                          style: TextStyle(
                              fontFamily: DesignSystem.fontFamily,
                              fontSize: 20,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-photo/portrait-handsome-young-man_53876-38137.jpg?size=626&ext=jpg&ga=GA1.1.735520172.1711238400&semt=ais'),
                  )
                ],
              ),
            ),
            Container(
              height: 550,
              decoration: const BoxDecoration(
                  color: DesignSystem.c4,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: const Column(
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
                        routePage: CarListDayPage(),
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
                      /*
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TestPage()));
                      }, child: Icon(Icons.add,size: 100,))*/
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
          ])
      )),
    );
  }
}
