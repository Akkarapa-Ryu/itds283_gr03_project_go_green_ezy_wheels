import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../constants/constants.dart';
import '../../main_page.dart';
import '../../theme/theme.dart';

class SuccessPage extends StatefulWidget {
  SuccessPage(
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
      required this.endDate,
      required this.data});
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
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DesignSystem.c15,
              DesignSystem.c14,
            ],
            stops: [0.7, 1.5],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(39),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 45),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: Column(
                    children: [
                      textContainer(SuccessMessage.youHaveSuccessBooking,
                          DesignSystem.c0, FontWeight.bold, 22),
                      textContainer(SuccessMessage.carRental, DesignSystem.c0,
                          FontWeight.bold, 22),
                      const SizedBox(height: 10),
                      textContainer(SuccessMessage.thankYouForewgb,
                          DesignSystem.c10, FontWeight.normal, 14),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      containerImage(widget.thumbnail, 150, 350),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                textContainer(
                    '${widget.data.first.data()["fname"]}   ${widget.data.first.data()["lname"]}',
                    DesignSystem.c0,
                    FontWeight.bold,
                    20),
                const SizedBox(height: 10),
                textContainer(
                    '${widget.title}', DesignSystem.c10, FontWeight.bold, 20),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 25,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textContainer(SuccessMessage.appointment,
                            DesignSystem.c10, FontWeight.w500, 16),
                        textContainer('${widget.startDate.data}',
                            DesignSystem.c0, FontWeight.w500, 16),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
                CustomButton(
                  colorButton: DesignSystem.c1,
                  sizeButtonHeight: 50,
                  sizeButtonWidth: 300,
                  textButton: SuccessMessage.backToHome,
                  textWeight: FontWeight.bold,
                  textSize: 16,
                  colorText: DesignSystem.c0,
                  routePageClose: 'back',
                  routePage: MainPage(
                      email: widget.data.first.data()['email'],
                      password: widget.data.first.data()['password']),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
