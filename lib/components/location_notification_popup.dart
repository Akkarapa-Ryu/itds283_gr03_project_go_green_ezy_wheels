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
                    'Instructions', DesignSystem.c0, FontWeight.w600, 24),
                content: Container(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textContainer('Using Loation', DesignSystem.c0, FontWeight.w500, 16),
                                            SizedBox(height: 10,),
                      textContainer('1. Open the location of the mobile phone.', DesignSystem.c0, FontWeight.w500, 16),
                      textContainer('2. Then press "Pin" on the app page.', DesignSystem.c0, FontWeight.w500, 16),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      child: textContainer(
                          'Close', DesignSystem.c0, FontWeight.w600, 16),
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
