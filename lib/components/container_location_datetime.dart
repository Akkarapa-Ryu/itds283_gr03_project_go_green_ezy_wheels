import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/theme.dart';

class ContainerLocationDateTimeWidget extends StatelessWidget {
  const ContainerLocationDateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 120,
      decoration: BoxDecoration(
          color: DesignSystem.c2, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_pin,
                color: DesignSystem.c1,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Mahidol University',
                style: TextStyle(
                    color: DesignSystem.c1,
                    fontFamily: DesignSystem.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )
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
              // https://stackoverflow.com/questions/51579546/how-to-format-datetime-in-flutter
              Text(
                DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.now()),
                style: const TextStyle(
                    color: DesignSystem.c1,
                    fontFamily: DesignSystem.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const Icon(
                Icons.arrow_forward,
                color: DesignSystem.c1,
              ),
              // https://stackoverflow.com/questions/64871346/flutter-how-to-show-current-date-and-next-5-day-dates
              Text(
                DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.now().add(Duration(days: 1))),
                style: const TextStyle(
                    color: DesignSystem.c1,
                    fontFamily: DesignSystem.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
