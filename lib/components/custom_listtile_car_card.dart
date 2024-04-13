import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../theme/theme.dart';

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
      required this.brand});

  final String thumbnail;
  final String title; // name's car
  final String type; // type,
  final int rage;
  final String seat;
  final int dc; // dc
  final int? ac;
  final String? supercharge;
  final num priceHour;
  final num priceDay;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
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
                      children: [containerImage(thumbnail)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              '$priceHour / ${CarListMessage.hour}',
                              style: const TextStyle(
                                  fontFamily: DesignSystem.fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            Text(
                              '$priceDay / ${CarListMessage.day}',
                              style: const TextStyle(
                                  fontFamily: DesignSystem.fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
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
                      padding: EdgeInsets.only(left: 20, right: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontFamily: DesignSystem.fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Row(
                            children: [
                              Text(
                                '${CarListMessage.type}: $type  ${CarListMessage.rage}: $rage  ${CarListMessage.seat}: $seat',
                                style: const TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${CarListMessage.dc}: $dc ${CarListMessage.kwH}',
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                              superchargeORac(supercharge, ac),
                            ],
                          ),
                          // Text('Brand: $brand',style: TextStyle(
                          //           fontFamily: DesignSystem.fontFamily,
                          //           fontWeight: FontWeight.w500,
                          //           fontSize: 11),),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: DesignSystem.c6),
                              child: const Text(
                                '      ${CarListMessage.select}      ',
                                style: TextStyle(
                                    fontFamily: DesignSystem.fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: DesignSystem.c1),
                              ))
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }

// https://flutterdesk.com/show-conditional-widgets-in-flutter/
  superchargeORac(supercharge, ac) {
    if (supercharge != "-") {
      return Text(
        ' ($supercharge)',
        style: const TextStyle(
            fontFamily: DesignSystem.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 11),
      );
    } else if (ac != 0) {
      return Text(
        '  ${CarListMessage.ac}: $ac${CarListMessage.kwH}',
        style: const TextStyle(
            fontFamily: DesignSystem.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 11),
      );
    }
  }
}

// https://www.youtube.com/watch?v=0ZHqrf0mzrI
containerImage(String thumbnail) {
  final urlDrive = thumbnail.split('/');
  final pathH = 'https://drive.google.com/uc?export=view&id=${urlDrive[5]}';

  // print('URL: $thumbnail');
  // print("Url Drive: $urlDrive");
  // print('Path: $pathH');
  return Image.network(
    pathH,
    height: 90,
    width: 150,
  );
}
