import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import '../constants/constants.dart';
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
                title: textContainer(LocationPopUpMessage.instructions,
                    DesignSystem.c0, FontWeight.w600, 24),
                content: Container(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textContainer(LocationPopUpMessage.usingLocation,
                          DesignSystem.c0, FontWeight.w500, 16),
                      const SizedBox(
                        height: 10,
                      ),
                      textContainer(LocationPopUpMessage.one, DesignSystem.c0,
                          FontWeight.w500, 16),
                      textContainer(LocationPopUpMessage.two, DesignSystem.c0,
                          FontWeight.w500, 16),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      child: textContainer(LocationPopUpMessage.close,
                          DesignSystem.c0, FontWeight.w600, 16),
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
