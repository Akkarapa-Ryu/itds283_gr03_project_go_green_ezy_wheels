import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  List locationMessage = [];
  double lat = 0;
  double long = 0;
  String address = "Loading . . . .";

  getDate() async {
    QuerySnapshot querySnapshotCarList =
        await FirebaseFirestore.instance.collection('cars').get();

    carsList.addAll(querySnapshotCarList.docs);
    setState(() {});
  }

  Future<Position> _getCurrentLOcation() async {
    // เป็นการ check ว่ามีการเปิด location บนมือถือหรือยัง
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request');
    }
    return await Geolocator.getCurrentPosition();
  }

  getLocationName() async {
    double latitude = lat;
    double longitude = long;

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      setState(() {
        address =
            "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        address = "Error fetching location";
      });
    }
  }

  @override
  void initState() {
    getDate();
    super.initState();
    getLocationName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Positioned(
                top: 420,
                left: 100,
                child: Icon(
                  IconData(0xf6b2,
                      fontFamily: DesignSystem.fontIconMaterialIcons),
                  size: 450,
                  color: DesignSystem.c13,
                )),
            const Positioned(
                top: -50,
                left: -150,
                child: Icon(
                  IconData(0xf07f8,
                      fontFamily: DesignSystem.fontIconMaterialIcons),
                  size: 450,
                  color: DesignSystem.c13,
                )),
            Column(children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textContainer(HomeMessage.hello, DesignSystem.c0,
                        FontWeight.w600, 20),
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
                margin: const EdgeInsets.all(15),
                height: 500,
                decoration: const BoxDecoration(
                  color: DesignSystem.c11,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const HomeMenuButton(
                          iconMenu: Icon(IconData(0xee2d,
                              fontFamily: DesignSystem.fontIconMaterialIcons)),
                          text: HomeMessage.hour,
                        ),
                        SizedBox(
                          height: 170,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  _getCurrentLOcation().then((value) {
                                    lat = value.latitude;
                                    long = value.longitude;
                                    setState(() {
                                      locationMessage.add(lat);
                                      locationMessage.add(long);
                                      print(
                                          'LocationMessage" $locationMessage');
                                    });
                                    getLocationName();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CarListDayPage(
                                            data: widget.data,
                                            address: address,
                                          ),
                                        ));
                                  });
                                },
                                child: Container(
                                  height: 85,
                                  width: 85,
                                  decoration: const BoxDecoration(
                                      color: DesignSystem.c1,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Icon(Icons.sunny,
                                      size: 65, color: DesignSystem.c6),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  HomeMessage.day,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontFamily: DesignSystem.fontFamily,
                                      fontSize: 15,
                                      color: DesignSystem.c1,
                                      shadows: [
                                        Shadow(
                                            color: DesignSystem.disable,
                                            blurRadius: 1,
                                            offset: Offset(1, 1))
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        const HomeMenuButton(
                          iconMenu: Icon(Icons.calendar_month),
                          text: HomeMessage.longTerm,
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeMenuButton(
                          iconMenu: Icon(Icons.charging_station),
                          text: HomeMessage.evCharger,
                          routePage: EvChargerPage(),
                        ),
                        HomeMenuButton(
                          iconMenu: Icon(IconData(0xf6b2,
                              fontFamily: DesignSystem.fontIconMaterialIcons)),
                          text: HomeMessage.vanWithDriver,
                        ),
                        HomeMenuButton(
                          iconMenu: Icon(IconData(0xf6b2,
                              fontFamily: DesignSystem.fontIconMaterialIcons)),
                          text: HomeMessage.premiumCarWithDriver,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
