import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import 'components.dart';

class LocationNotificationPopup extends StatefulWidget {
  const LocationNotificationPopup({super.key});

  @override
  State<LocationNotificationPopup> createState() =>
      _LocationNotificationPopupState();
}

class _LocationNotificationPopupState extends State<LocationNotificationPopup> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: DesignSystem.c1,
                title: textContainer(
                    'Location', DesignSystem.c0, FontWeight.w600, 28),
                content: Container(
                  height: 150,
                  width: 200,
                  child: Column(
                    children: [
                      Text(
                        'Using Loation',
                        style: TextStyle(
                            fontFamily: DesignSystem.fontFamily,
                            fontSize: 16,
                            color: DesignSystem.c0,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      child: textContainer(
                          'Close', DesignSystem.c0, FontWeight.normal, 16),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              );
            });
      },
      child: const Icon(
        Icons.info_outline,
        color: DesignSystem.c0,
      ),
    );
  }
}
