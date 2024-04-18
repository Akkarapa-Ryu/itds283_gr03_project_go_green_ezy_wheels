import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/theme/design_system.dart';

class ConfirmPayPage extends StatefulWidget {
  const ConfirmPayPage(
      {super.key,
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
      required this.locationMessage,
      required this.startDate,
      required this.endDate});
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
  final String locationMessage;
  final Text startDate;
  final Text endDate;

  @override
  State<ConfirmPayPage> createState() => _ConfirmPayPageState();
}

class _ConfirmPayPageState extends State<ConfirmPayPage> {
  // String address = "Loading . . . .";
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getLocationName();
  }
  // getLocationName() async {
  //   final location = widget.locationMessage.split(",");
  //   final location_lat = location[0].split(" ");
  //   final location_long = location[1].split(" ");
  //   final lat = double.parse(location_lat[1]);
  //   final long = double.parse(location_long[2]);

  //   double latitude = lat;
  //   double longitude = long;

  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
  //     Placemark place = placemarks[0];
  //     setState(() {
  //       address = "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
  //     });
  //   } catch (e) {
  //     setState(() {
  //       address = "Error fetching location";
  //     });
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirm & Pay',
          style: TextStyle(
              fontFamily: DesignSystem.fontFamily, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "${widget.title}",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: DesignSystem.fontFamily,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: DesignSystem.c6, width: 2),
                  borderRadius: BorderRadius.circular(15),
                  color: DesignSystem.c1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: DesignSystem.c6,
                      ),
                      Text(widget.locationMessage,
                          style: const TextStyle(
                              color: DesignSystem.c6,
                              fontFamily: DesignSystem.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 16))
                    ],
                  ),
                  Container(
                    height: 2,
                    width: 250,
                    color: DesignSystem.c6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${widget.startDate.data}",
                          style: const TextStyle(
                              color: DesignSystem.c6,
                              fontFamily: DesignSystem.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                      Icon(
                        Icons.arrow_forward,
                        color: DesignSystem.c6,
                      ),
                      Text("${widget.endDate.data}",
                          style: const TextStyle(
                              color: DesignSystem.c6,
                              fontFamily: DesignSystem.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pick-up & Return location"),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: DesignSystem.c6,
                    ),
                    // Text("$lat"),
                    // Text("$long"),
                    Text(widget.locationMessage)
                  ],
                ),
                SizedBox(height: 20,),
                Container(height: 2,width: 300,color: DesignSystem.c0,),
                SizedBox(height: 20,),
                Text("Price summary"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Rental"),Text("${widget.priceDay}")],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("1 day rate"),Text("${widget.priceDay}")],),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Total Payment"),Text("${widget.priceDay}")],),
                SizedBox(height: 20,),
                Container(height: 2,width: 300,color: DesignSystem.c0,),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Full Name"),Text("${widget.priceDay}")],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<String> getAddress(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    return "${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
  } catch (e) {
    return "Unable to fetch the address";
  }
}
