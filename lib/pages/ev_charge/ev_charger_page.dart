import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../constants/constants.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';
import 'package:latlong2/latlong.dart';

class EvChargerPage extends StatefulWidget {
  const EvChargerPage({super.key});

  @override
  State<EvChargerPage> createState() => _EvChargerPageState();
}

class _EvChargerPageState extends State<EvChargerPage> {
  List locationMessage = [];
  double lat = 0;
  double long = 0;
  String address = "Loading . . . .";

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

  bool showImage = false;

  @override
  void initState() {
    super.initState();
    getLocationName();
    // showIm();
  }

  // https://codelabs.developers.google.com/codelabs/google-maps-in-flutter#3
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: textContainer(EvChargerMessage.evChargerMap, DesignSystem.c0,
              FontWeight.bold, null),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/background.jpg',
                    fit: BoxFit.fitWidth,
                    width: double.maxFinite,
                    alignment: Alignment(0, 0.25),
                  ),
                ),
              ),
              Row(
                children: [IconButton(
                onPressed: () {
                  _getCurrentLOcation().then((value) {
                    lat = value.latitude;
                    long = value.longitude;
                    setState(() {
                      locationMessage.add(lat);
                      locationMessage.add(long);
                      print('LocationMessage" $locationMessage');
                      showImage = !showImage;
                    });
                    getLocationName();
                  });
                },
                icon: Icon(
                  size: 35,
                  Icons.location_pin,
                  color: DesignSystem.c4,
                ),
              ),
              Container(
                width: 320,
                child: textContainer(address, DesignSystem.c0, FontWeight.bold, 20),)],
              ),
              SizedBox(height: 10,),
              showImage
                  ? Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: FlutterMap(
                            options: MapOptions(
                                // initialCenter: LatLng(13.801773, 100.321121),
                                initialCenter: LatLng(lat, long),
                                initialZoom: 11,
                                interactionOptions: InteractionOptions(
                                    flags: ~InteractiveFlag.doubleTapZoom)),
                            children: [
                              openStreetMapTileLayer,
                              MarkerLayer(markers: [
                                Marker(
                                  point: LatLng(lat, long),
                                  width: 60,
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Navigate to another screen
                                    },
                                    child: Icon(
                                      Icons.location_pin,
                                      size: 60,
                                      color: DesignSystem.error,
                                    ),
                                  ),
                                )
                              ])
                            ]),
                      ),
                    )
                  : Container(
                      color: DesignSystem.c1,
                      height: 0,
                      width: 0,
                    ),
              CustomButton(
                colorButton: DesignSystem.c2,
                sizeButtonHeight: 45,
                sizeButtonWidth: double.infinity,
                textButton: EvChargerMessage.destinationToCharger,
                colorText: DesignSystem.c0,
                textSize: 16,
                textWeight: FontWeight.bold,
              )
            ],
          ),
        ));
  }
}

// https://www.youtube.com/watch?v=ZnZM8ot5lcc
TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
