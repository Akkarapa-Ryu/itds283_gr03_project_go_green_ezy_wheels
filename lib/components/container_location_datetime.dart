import 'package:flutter/material.dart';
import '../theme/theme.dart';

class ContainerLocationDateTimeWidget extends StatefulWidget {
  const ContainerLocationDateTimeWidget(
      {super.key,
      required this.iconLocation,
      required this.locationMessage,
      required this.startDate,
      required this.endDate});
  final Widget iconLocation;
  final String locationMessage;
  final Text startDate;
  final Text endDate;

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
              widget.iconLocation,
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 300,
                child: Text(
                  widget.locationMessage,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                      color: DesignSystem.c1,
                      fontFamily: DesignSystem.fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
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
              widget.startDate,
              const Icon(
                Icons.arrow_forward,
                color: DesignSystem.c1,
              ),
              widget.endDate,
            ],
          )
        ],
      ),
    );
  }
}
