import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import '../../models/models.dart';
import '../../theme/theme.dart';
import '../../components/components.dart';
import '../pages.dart';

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
      required this.endDate,
      required this.data});
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
  final List data;

  @override
  State<ConfirmPayPage> createState() => _ConfirmPayPageState();
}

class _ConfirmPayPageState extends State<ConfirmPayPage> {
  bool save = false;

  final querySnapshotHistory = FirebaseFirestore.instance.collection('history');

  Future saveData({
    required bool save,
    required String id,
    required String phone,
    required String fname,
    required String lname,
    required String email,
    required String password,
    required String thumbnail,
    required String title,
    required String type,
    required int rage,
    required String seat,
    required int dc,
    required num? ac,
    required String? supercharge,
    required num priceHour,
    required num priceDay,
    required String brand,
    required String transmossion,
    required String energyType,
    required num batteryLevel,
    required String locationMessage,
    required String startDate,
    required String endDate,
    required List data,
  }) async {
    if (save == true) {
      final querySnapshotHistoryDoc = querySnapshotHistory.doc();
      final history = HistoryModel(
          idH: querySnapshotHistoryDoc.id,
          id: id,
          phone: phone,
          fname: fname,
          lname: lname,
          email: email,
          thumbnail: thumbnail,
          title: title,
          type: type,
          priceHour: priceHour,
          priceDay: priceDay,
          brand: brand,
          locationMessage: locationMessage,
          startDate: startDate,
          endDate: endDate);
      final json = history.toJson();
      querySnapshotHistoryDoc.set(json);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SuccessPage(
                  thumbnail: thumbnail,
                  title: title,
                  type: type,
                  rage: rage,
                  seat: seat,
                  dc: dc,
                  priceHour: priceHour,
                  priceDay: priceDay,
                  brand: brand,
                  transmossion: transmossion,
                  energyType: energyType,
                  batteryLevel: batteryLevel,
                  locationMessage: locationMessage,
                  startDate: widget.startDate,
                  endDate: widget.endDate,
                  data: data)));
    } else {
      print("Failed!!!");
    }
    save = false;
  }

  @override
  void initState() {
    super.initState();
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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
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
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 250,
                            child: Text(widget.locationMessage,
                                softWrap: true,
                                maxLines: 2,
                                style: const TextStyle(
                                    color: DesignSystem.c6,
                                    fontFamily: DesignSystem.fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          )
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 2,
                      width: 300,
                      color: DesignSystem.c0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Price summary"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Rental"), Text("${widget.priceDay}")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1 day rate"),
                        Text("${widget.priceDay}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Payment"),
                        Text("${widget.priceDay}")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 2,
                      width: 300,
                      color: DesignSystem.c0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("Full Name:   "),
                        Text(
                            "${widget.data.first.data()["fname"]}   ${widget.data.first.data()["lname"]}"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Email:   "),
                        Text("${widget.data.first.data()["email"]}")
                      ],
                    ),
                    Row(
                      children: [
                        Text("Phone:   "),
                        Text("${widget.data.first.data()["phone"]}")
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              top: 715,
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                alignment: Alignment.topCenter,
                height: 100,
                width: 410,
                decoration: BoxDecoration(
                    color: DesignSystem.c1,
                    boxShadow: const [
                      BoxShadow(
                          color: DesignSystem.c0,
                          blurRadius: 2,
                          spreadRadius: 1,
                          blurStyle: BlurStyle.outer)
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '21 \$ / hour',
                          style: TextStyle(
                              fontFamily: DesignSystem.fontFamily,
                              fontSize: 15),
                        ),
                        Text(
                          '210 \$ / Day',
                          style: TextStyle(
                              fontFamily: DesignSystem.fontFamily,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    /*CustomButton(
                      colorButton: DesignSystem.c6,
                      sizeButtonHeight: 40,
                      textButton: 'Continue',
                      colorText: DesignSystem.c1,
                      textSize: 20,
                      textWeight: FontWeight.w600,
                      borderRadius: 30,
                      sizeButtonWidth: 120,
                    ),*/
                    ElevatedButton(
                        onPressed: () {
                          save = true;
                          saveData(
                              save: save,
                              id: widget.data.first.data()["id"],
                              phone: widget.data.first.data()["phone"],
                              fname: widget.data.first.data()["fname"],
                              lname: widget.data.first.data()["lname"],
                              email: widget.data.first.data()["email"],
                              password: widget.data.first.data()["password"],
                              thumbnail: widget.thumbnail,
                              title: widget.title,
                              type: widget.type,
                              rage: widget.rage,
                              seat: widget.seat,
                              dc: widget.dc,
                              ac: widget.ac,
                              supercharge: widget.supercharge,
                              priceHour: widget.priceHour,
                              priceDay: widget.priceDay,
                              brand: widget.brand,
                              transmossion: widget.transmossion,
                              energyType: widget.energyType,
                              batteryLevel: widget.batteryLevel,
                              locationMessage: widget.locationMessage,
                              startDate: "${widget.startDate.data}",
                              endDate: "${widget.endDate.data}",
                              data: widget.data);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          backgroundColor: DesignSystem.c6,
                          minimumSize: Size(120, 40)
                        ),
                        child: Text("Continue",
                            style: TextStyle(
                                color: DesignSystem.c1,
                                fontFamily: DesignSystem.fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)))
                  ],
                ),
              ))
        ],
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
