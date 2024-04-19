import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/components/components.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/constants/success_message.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/main_page.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/models/models.dart';
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DesignSystem.c4,
              DesignSystem.c6,
            ],
            stops: [0.7, 1.5],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(39),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 45),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/images/logo.jpg'),
                  ),
                ),
                SizedBox(height: 25),
                Center(
                  child: Column(
                    children: [
                      Text(
                        SuccessMessage.youHaveSuccessBooking,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: DesignSystem.c0,
                            fontFamily: DesignSystem.fontFamily),
                      ),
                      Text(
                        SuccessMessage.carRental,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: DesignSystem.c0,
                            fontFamily: DesignSystem.fontFamily),
                      ),
                      SizedBox(height: 10),
                      Text(
                        SuccessMessage.thankYouForewgb,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: DesignSystem.c10,
                            fontFamily: DesignSystem.fontFamily),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      containerImage(widget.thumbnail, 150, 350),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '${widget.data.first.data()["fname"]}   ${widget.data.first.data()["lname"]}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: DesignSystem.c0,
                      fontFamily: DesignSystem.fontFamily),
                ),
                SizedBox(height: 10),
                Text(
                  '${widget.title}',
                  style: TextStyle(
                      fontSize: 20,
                      color: DesignSystem.c10,
                      fontWeight: FontWeight.bold,
                      fontFamily: DesignSystem.fontFamily),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 25,
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          SuccessMessage.appointment,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: DesignSystem.c10,
                              fontFamily: DesignSystem.fontFamily),
                        ),
                        Text(
                          '${widget.startDate.data}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: DesignSystem.c0,
                              fontFamily: DesignSystem.fontFamily),
                        ),
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
