import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../theme/theme.dart';
import 'components.dart';
import 'container_text.dart';

// https://api.flutter.dev/flutter/material/ListTile-class.html

class CustomListTileCarCard extends StatelessWidget {
  const CustomListTileCarCard(
      {super.key,
      required this.thumbnail,
      required this.title,
      required this.type,
      required this.dc,
      this.ac,
      this.supercharge,
      required this.priceHour,
      required this.priceDay,
      required this.rage,
      required this.seat,
      required this.brand,
      required this.transmossion,
      required this.energyType,
      required this.batteryLevel,
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
  final Widget? routePage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: 130,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [containerImage(thumbnail, 90, 150)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          textContainer('$priceHour / ${CarListMessage.hour}',
                              DesignSystem.c0, FontWeight.w600, 14),
                          textContainer('$priceDay / ${CarListMessage.day}',
                              DesignSystem.c0, FontWeight.w600, 14),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textContainer(
                            title,
                            DesignSystem.c0,
                            FontWeight.bold,
                            16),
                    Row(
                      children: [
                        textContainer(
                            '${CarListMessage.type}: $type  ${CarListMessage.rage}: $rage  ${CarListMessage.seat}: $seat',
                            DesignSystem.c0,
                            FontWeight.w500,
                            11),
                      ],
                    ),
                    Row(
                      children: [
                        textContainer(
                            '${CarListMessage.dc}: $dc ${CarListMessage.kwH}',
                            DesignSystem.c0,
                            FontWeight.w500,
                            11),
                        superchargeORac(supercharge, ac),
                      ],
                    ),
                    CustomButton(
                      colorButton: DesignSystem.c6,
                      textButton: CarListMessage.select,
                      colorText: DesignSystem.c1,
                      textSize: 14,
                      textWeight: FontWeight.bold,
                      routePage: routePage,
                      borderRadius: 20,
                      sizeButtonHeight: 40,
                      sizeButtonWidth: 120,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// https://flutterdesk.com/show-conditional-widgets-in-flutter/
  superchargeORac(supercharge, ac) {
    if (supercharge != "-") {
      return textContainer(
          ' ($supercharge)', DesignSystem.c0, FontWeight.w500, 11);
    } else if (ac != 0) {
      return 
      textContainer(
          '  ${CarListMessage.ac}: $ac${CarListMessage.kwH}', DesignSystem.c0, FontWeight.w500, 11);
    }
  }
}
