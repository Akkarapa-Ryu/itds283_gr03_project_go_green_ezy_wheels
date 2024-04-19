import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';
import '../../constants/constants.dart';
import '../pages.dart';

class CarListDayPage extends StatefulWidget {
  const CarListDayPage({super.key, required this.data,
  });
  final List data;

  @override
  State<CarListDayPage> createState() => _CarListDayPageState();
}

class _CarListDayPageState extends State<CarListDayPage> {
  List<QueryDocumentSnapshot> carsList = [];
  List locationMessage = [];
  double lat = 0;
  double long = 0;
  final startDate = Text(
    DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.now()),
    style: const TextStyle(
        color: DesignSystem.c1,
        fontFamily: DesignSystem.fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16),
  );
  final endDate = Text(
    DateFormat('dd MMMM yyyy, HH:mm')
        .format(DateTime.now().add(Duration(days: 1))),
    style: const TextStyle(
        color: DesignSystem.c1,
        fontFamily: DesignSystem.fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16),
  );
  String address = "Loading . . . .";

  // https://www.youtube.com/watch?v=9v44lAagZCI
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

  // late ContainerLocationDateTimeWidget locationMessage = ContainerLocationDateTimeWidget();
  getDate() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('cars').get();

    carsList.addAll(querySnapshot.docs);
    setState(() {});
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
      backgroundColor: DesignSystem.c1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          CarListMessage.carList,
          style: TextStyle(
              fontFamily: DesignSystem.fontFamily, fontWeight: FontWeight.w700),
        ),
        actions: [LocationNotificationPopup()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            ContainerLocationDateTimeWidget(
              iconLocation: IconButton(
                onPressed: () {
                  _getCurrentLOcation().then((value) {
                    lat = value.latitude;
                    long = value.longitude;
                    setState(() {
                      // locationMessage = 'Latitude: $lat ,\n Longtitude: $long';
                      locationMessage.add(lat);
                      locationMessage.add(long);
                      print('LocationMessage" $locationMessage');
                    });
                    getLocationName();
                  });
                },
                icon: Icon(
                  Icons.location_pin,
                  color: DesignSystem.c1,
                ),
              ),
              // locationMessage: locationMessage,
              locationMessage: address,
              startDate: startDate,
              endDate: endDate,
            ),
            // Text(address),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(3),
                  itemCount: carsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: DesignSystem.c1,
                      surfaceTintColor: DesignSystem.c1,
                      elevation: 3,
                      margin: const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      child: CustomListTileCarCard(
                        thumbnail: carsList[index].get('image'),
                        title: carsList[index].get('name'),
                        type: carsList[index].get('type'),
                        dc: carsList[index].get('dc'),
                        priceHour: carsList[index].get('priceHour'),
                        priceDay: carsList[index].get('priceDay'),
                        rage: carsList[index].get('rage'),
                        seat: carsList[index].get('seat'),
                        brand: carsList[index].get('brand'),
                        supercharge: carsList[index].get('superCharger'),
                        ac: carsList[index].get('ac'),
                        transmossion: carsList[index].get('transmossion'),
                        energyType: carsList[index].get('energyType'),
                        batteryLevel: carsList[index].get('batteryLevel'),
                        routePage: BookingDayCarRentalPage(
                          thumbnail: carsList[index].get('image'),
                          title: carsList[index].get('name'),
                          type: carsList[index].get('type'),
                          rage: carsList[index].get('rage'),
                          seat: carsList[index].get('seat'),
                          dc: carsList[index].get('dc'),
                          priceHour: carsList[index].get('priceHour'),
                          priceDay: carsList[index].get('priceDay'),
                          brand: carsList[index].get('brand'),
                          transmossion: carsList[index].get('transmossion'),
                          energyType: carsList[index].get('energyType'),
                          batteryLevel: carsList[index].get('batteryLevel'),
                          locationMessage: address,
                          startDate: startDate,
                          endDate: endDate, data: widget.data,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
