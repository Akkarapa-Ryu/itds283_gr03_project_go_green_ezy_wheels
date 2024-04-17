import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../theme/theme.dart';

class ContainerLocationDateTimeWidget extends StatefulWidget {
  const ContainerLocationDateTimeWidget({super.key, required this.iconLocation, required this.locationMessage});
  final Widget iconLocation;
  final String locationMessage;

  @override
  State<ContainerLocationDateTimeWidget> createState() =>
      _ContainerLocationDateTimeWidgetState();
}

class _ContainerLocationDateTimeWidgetState
    extends State<ContainerLocationDateTimeWidget> {
  // String locationMessage = 'Current Location of the User';
  late String lat;
  late String long;

  // https://www.youtube.com/watch?v=9v44lAagZCI
 /* Future<Position> _getCurrentLOcation() async {
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
  }  */

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.all(8),
      height: 120,
      decoration: BoxDecoration(
          color: DesignSystem.c2, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // IconButton(
              //   onPressed: () {
              //     _getCurrentLOcation().then((value) {
              //       lat = '${value.latitude}';
              //       long = '${value.longitude}';
              //       setState(() {
              //         locationMessage =
              //             'Latitude: $lat ,\n Longtitude: $long';
              //             print('LocationMessage" $locationMessage');
              //       });
              //       // liveLocation();
              //     });
              //   },
              //   icon: Icon(
              //     Icons.location_pin,
              //     color: DesignSystem.c1,
              //   ),
              // ),
              widget.iconLocation,
              SizedBox(
                width: 10,
              ),
              Text(
                widget.locationMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: DesignSystem.c1,
                    fontFamily: DesignSystem.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )
            ],
          ),
          Container(
            height: 2,
            width: 250,
            color: DesignSystem.c1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // https://stackoverflow.com/questions/51579546/how-to-format-datetime-in-flutter
              Text(
                DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.now()),
                style: const TextStyle(
                    color: DesignSystem.c1,
                    fontFamily: DesignSystem.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const Icon(
                Icons.arrow_forward,
                color: DesignSystem.c1,
              ),
              // https://stackoverflow.com/questions/64871346/flutter-how-to-show-current-date-and-next-5-day-dates
              Text(
                DateFormat('dd MMMM yyyy, HH:mm')
                    .format(DateTime.now().add(Duration(days: 1))),
                style: const TextStyle(
                    color: DesignSystem.c1,
                    fontFamily: DesignSystem.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }

  void liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        // locationMessage = 'Latitude: $lat , Longitude: $long';
      });
    });
  }
  
  // Open Google Map
  /*Future<void> _openMap(String lat, String long) async {
    String googleURL = 'https://google.com/maps/search/?api=1&query=$lat,$long';
    print('GoogleURL: $googleURL');
    await canLaunchUrlString(googleURL)
      ? await launchUrlString(googleURL)
      : throw 'Could not launch $googleURL';
  }*/
}
