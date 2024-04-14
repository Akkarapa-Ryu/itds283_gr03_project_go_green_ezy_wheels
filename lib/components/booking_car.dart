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
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: [
            ContainerLocationDateTimeWidget(),
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
            Text(
              title,
              style: const TextStyle(
                  fontSize: 25,
                  fontFamily: DesignSystem.fontFamily,
                  fontWeight: FontWeight.bold),
            ),
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
                              Text(
                                '${BookingMessage.vihicalType}',
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c6),
                              ),
                              Text(
                                type,
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c0),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${BookingMessage.transmossion}',
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c6),
                              ),
                              Text(
                                transmossion,
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c0),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${BookingMessage.seat}',
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c6),
                              ),
                              Text(
                                seat,
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c0),
                              )
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
                              Text(
                                '${BookingMessage.energyType}',
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c6),
                              ),
                              Text(
                                energyType,
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c0),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${BookingMessage.batteryLevel}',
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c6),
                              ),
                              Text(
                                '$batteryLevel',
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: DesignSystem.c0),
                              )
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
            top: 735,
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
                        '$priceHour \$ / ${BookingMessage.hour}',
                        style: TextStyle(
                            fontFamily: DesignSystem.fontFamily, fontSize: 15),
                      ),
                      Text(
                        '$priceDay \$ / ${BookingMessage.day}',
                        style: TextStyle(
                            fontFamily: DesignSystem.fontFamily,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CustomButton(
                    colorButton: DesignSystem.c6,
                    heightSizeButton: 35,
                    textButton: BookingMessage.select,
                    colorText: DesignSystem.c1,
                    textSize: 20,
                    textWeight: FontWeight.w600,
                    borderRadius: 20,
                    widthSizeButton: 120,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}