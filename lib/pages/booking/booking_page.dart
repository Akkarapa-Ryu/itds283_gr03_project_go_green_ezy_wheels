import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../../constants/constants.dart';
import '../../theme/theme.dart';

class BookingCarRentalPage extends StatelessWidget {
  const BookingCarRentalPage(
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
      required this.batteryLevel});
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(BookingMessage.rentel,
            style: TextStyle(
                color: DesignSystem.c0,
                fontFamily: DesignSystem.fontFamily,
                fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: BookingCar(
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
            batteryLevel: batteryLevel));
  }
}
