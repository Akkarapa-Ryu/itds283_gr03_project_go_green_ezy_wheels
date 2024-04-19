import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import '../../components/components.dart';
import '../../constants/constants.dart';
import '../pages.dart';

class BookingDayCarRentalPage extends StatelessWidget {
  const BookingDayCarRentalPage(
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
      required this.endDate, required this.data});
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            BookingMessage.rentelDay,
            style: TextStyle(
                color: DesignSystem.c0,
                fontFamily: DesignSystem.fontFamily,
                fontWeight: FontWeight.bold),
          ),
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
            batteryLevel: batteryLevel,
            locationMessage: Text(
              locationMessage,
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 2,
              style: TextStyle(
                  color: DesignSystem.c1,
                  fontFamily: DesignSystem.fontFamily,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            startDate: startDate,
            endDate: endDate,
            routePage: ConfirmPayPage(
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
                startDate: startDate,
                endDate: endDate, data: data,)));
  }
}
