import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/container_text.dart';
import '../../constants/constants.dart';
import '../../models/models.dart';
import '../../theme/theme.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textContainer(ConfirmPayMessage.confirmPay, DesignSystem.c0,
            FontWeight.w700, null),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                textContainer(
                    "${widget.title}", DesignSystem.c0, FontWeight.bold, 24),
                const SizedBox(
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
                          const Icon(
                            Icons.location_pin,
                            color: DesignSystem.c6,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 250,
                            child: textContainer(widget.locationMessage,
                                DesignSystem.c6, FontWeight.w600, 16),
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
                          textContainer("${widget.startDate.data}",
                              DesignSystem.c6, FontWeight.w600, 16),
                          const Icon(
                            Icons.arrow_forward,
                            color: DesignSystem.c6,
                          ),
                          textContainer("${widget.endDate.data}",
                              DesignSystem.c6, FontWeight.w600, 16),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textContainer(ConfirmPayMessage.pickUpReturnLocation,
                          DesignSystem.c0, FontWeight.bold, 18),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: DesignSystem.c6,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 300,
                            child: textContainer(widget.locationMessage,
                                DesignSystem.c0, FontWeight.w500, 18),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 2,
                        width: double.maxFinite,
                        color: DesignSystem.c0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textContainer(ConfirmPayMessage.priceSummary,
                          DesignSystem.c0, FontWeight.bold, 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textContainer("     ${ConfirmPayMessage.rental}",
                              DesignSystem.c0, FontWeight.w500, 18),
                          textContainer("${widget.priceDay} \$",
                              DesignSystem.c0, FontWeight.w500, 18),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textContainer("     ${ConfirmPayMessage.oneDayRate}",
                              DesignSystem.c0, FontWeight.w500, 18),
                          textContainer("${widget.priceDay} \$",
                              DesignSystem.c0, FontWeight.w500, 18),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textContainer(ConfirmPayMessage.totalPayment,
                              DesignSystem.c0, FontWeight.bold, 18),
                          textContainer("${widget.priceDay} \$",
                              DesignSystem.c0, FontWeight.w500, 18),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 2,
                        width: double.maxFinite,
                        color: DesignSystem.c0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          textContainer("${ConfirmPayMessage.fullName}:   ",
                              DesignSystem.c0, FontWeight.bold, 18),
                          textContainer(
                              "${widget.data.first.data()["fname"]}   ${widget.data.first.data()["lname"]}",
                              DesignSystem.c0,
                              FontWeight.w500,
                              18),
                        ],
                      ),
                      Row(
                        children: [
                          textContainer("${ConfirmPayMessage.email}:   ",
                              DesignSystem.c0, FontWeight.bold, 18),
                          textContainer("${widget.data.first.data()["email"]}",
                              DesignSystem.c0, FontWeight.w500, 18),
                        ],
                      ),
                      Row(
                        children: [
                          textContainer("${ConfirmPayMessage.phone}:   ",
                              DesignSystem.c0, FontWeight.bold, 18),
                          textContainer("${widget.data.first.data()["phone"]}",
                              DesignSystem.c0, FontWeight.w500, 18),
                        ],
                      ),
                    ],
                  ),
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
                        textContainer(ConfirmPayMessage.totalPayment,
                            DesignSystem.c0, FontWeight.normal, 15),
                        textContainer('${widget.priceDay} \$ / ${ConfirmPayMessage.day}',
                            DesignSystem.c0, FontWeight.bold, 24),
                      ],
                    ),
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: DesignSystem.c6,
                            minimumSize: Size(120, 40)),
                        child: textContainer(ConfirmPayMessage.continueText,
                            DesignSystem.c1, FontWeight.bold, 20))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
