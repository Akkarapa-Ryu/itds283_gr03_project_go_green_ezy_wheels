
import 'package:flutter/material.dart';

class ReservationBook extends StatelessWidget {
  const ReservationBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              
              Color(0xff32AEB7),
              Color(0xff13526D),
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
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/logo.jpg'),
                  ),
                ),
                SizedBox(height: 25),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'You have successfully Booking',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        'Car rental',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Thank You For  "Eazy Wheels and Green Mobility"',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 12, 53, 236)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/Tesla Model S (Plaid).png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Positioned(
                            //   left: 110,
                            //   top: 5,
                            //   child: Container(
                            //     width: 130,
                            //     height: 130,
                            //     decoration: BoxDecoration(
                            //       color: const Color.fromARGB(255, 255, 255, 255),
                            //       borderRadius: BorderRadius.circular(100),
                            //     ),
                            //     child: Center(
                            //       child: Icon(Icons.person, size: 60, color: const Color.fromARGB(255, 0, 0, 0)),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Albert Flores',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'Tesla Model S Plaid',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 12, 53, 236)),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 25,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Appointment',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 12, 53, 236)),
                    ),
                  ],
                ),
                SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 40),
                    Text(
                      'Friday, 15 Mar 2024, 11:00 AM',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 55.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Back to home',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      padding:
                          EdgeInsets.symmetric(horizontal: 119, vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}