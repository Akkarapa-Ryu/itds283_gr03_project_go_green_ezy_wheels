import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../theme/theme.dart';
import 'components.dart';

class BookingCar extends StatelessWidget {
  const BookingCar(
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
      this.startDate,
      this.endDate,
      this.locationMessageFromIconButton,
      this.routePage});
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
  final Widget locationMessage;
  final Text? startDate;
  final Text? endDate;
  final String? locationMessageFromIconButton;
  final Widget? routePage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              height: 120,
              decoration: BoxDecoration(
                  color: DesignSystem.c2,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (locationMessageFromIconButton == null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 300, child: locationMessage),
                      ],
                    ),
                  if (locationMessageFromIconButton != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        locationMessage,
                        Container(
                          width: 300,
                          child: Text(
                            locationMessageFromIconButton!,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            maxLines: 2,
                            style: const TextStyle(
                                color: DesignSystem.c1,
                                fontFamily: DesignSystem.fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
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
                      Container(child: startDate),
                      const Icon(
                        Icons.arrow_forward,
                        color: DesignSystem.c1,
                      ),
                      Container(child: endDate),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: DesignSystem.c1,
              surfaceTintColor: DesignSystem.c1,
              shadowColor: DesignSystem.c0,
              elevation: 3,
              child: containerImage(thumbnail, 200, 360),
            ),
            const SizedBox(
              height: 20,
            ),
            textContainer(title, DesignSystem.c0, FontWeight.bold, 25),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: DottedBorder(
                dashPattern: [10, 5],
                color: DesignSystem.disable,
                child: Container(
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textContainer('${BookingMessage.vihicalType}',
                                  DesignSystem.c0, FontWeight.w500, 17),
                              textContainer(
                                  type, DesignSystem.c0, FontWeight.w500, 17),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textContainer('${BookingMessage.transmossion}',
                                  DesignSystem.c0, FontWeight.w500, 17),
                              textContainer(transmossion, DesignSystem.c0,
                                  FontWeight.w500, 17),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textContainer('${BookingMessage.seat}',
                                  DesignSystem.c0, FontWeight.w500, 17),
                              textContainer(
                                  seat, DesignSystem.c0, FontWeight.w500, 17),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 250,
                        height: 3,
                        decoration: BoxDecoration(
                            color: DesignSystem.disable,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textContainer('${BookingMessage.energyType}',
                                  DesignSystem.c0, FontWeight.w500, 17),
                              textContainer(energyType, DesignSystem.c0,
                                  FontWeight.w500, 17),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textContainer('${BookingMessage.batteryLevel}',
                                  DesignSystem.c0, FontWeight.w500, 17),
                              textContainer('$batteryLevel', DesignSystem.c0,
                                  FontWeight.w500, 17),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Positioned(
            top: 715,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                      textContainer('$priceHour \$ / ${BookingMessage.hour}',
                          DesignSystem.c0, FontWeight.normal, 15),
                      textContainer('$priceDay \$ / ${BookingMessage.day}',
                          DesignSystem.c0, FontWeight.bold, 24),
                    ],
                  ),
                  CustomButton(
                    colorButton: DesignSystem.c6,
                    sizeButtonHeight: 40,
                    textButton: BookingMessage.select,
                    colorText: DesignSystem.c1,
                    textSize: 20,
                    textWeight: FontWeight.w600,
                    borderRadius: 30,
                    sizeButtonWidth: 120,
                    routePage: routePage,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

// https://stackoverflow.com/questions/51579546/how-to-format-datetime-in-flutter
// https://stackoverflow.com/questions/64871346/flutter-how-to-show-current-date-and-next-5-day-dates