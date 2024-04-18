import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../../components/components.dart';
import '../../constants/constants.dart';
import '../../theme/theme.dart';

class BookingCarRentalPage extends StatefulWidget {
  const BookingCarRentalPage({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.type,
    required this.rage,
    required this.seat,
    required this.dc,
    this.ac,
    this.supercharge,
    required this.priceHour,
    required this.priceDay,
    required this.brand,
    required this.transmossion,
    required this.energyType,
    required this.batteryLevel,
  });
  final String thumbnail;
  final String title; // name's car
  final String type; // type,
  final int rage;
  final String seat;
  final int dc; // dc
  final num? ac;
  final String? supercharge;
  final num priceHour;
  final num priceDay;
  final String brand;
  final String transmossion;
  final String energyType;
  final num batteryLevel;

  @override
  State<BookingCarRentalPage> createState() => _BookingCarRentalPageState();
}

class _BookingCarRentalPageState extends State<BookingCarRentalPage> {
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
    super.initState();
    getLocationName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          BookingMessage.rentel,
          style: TextStyle(
              color: DesignSystem.c0,
              fontFamily: DesignSystem.fontFamily,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [LocationNotificationPopup()],
      ),
      body: BookingCar(
        thumbnail: widget.thumbnail,
        title: widget.title,
        type: widget.type,
        rage: widget.rage,
        seat: widget.seat,
        dc: widget.dc,
        priceHour: widget.priceHour,
        priceDay: widget.priceDay,
        brand: widget.brand,
        transmossion: widget.transmossion,
        energyType: widget.energyType,
        batteryLevel: widget.batteryLevel,
        locationMessage: IconButton(
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
        startDate: startDate,
        endDate: endDate,
        locationMessageFromIconButton: address,
      ),
    );
  }
}
