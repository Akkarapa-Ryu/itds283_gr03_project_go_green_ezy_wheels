import 'dart:async';

import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/pages/pages.dart';
import '/theme/theme.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // https://www.youtube.com/watch?v=-JWkAcYDQeQ
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()))
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignSystem.c2,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/logo.jpg',
                color: DesignSystem.c7,
                colorBlendMode: BlendMode.difference,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              LandingMessage.ggew,
              style: TextStyle(
                  color: DesignSystem.c3,
                  fontSize: 22,
                  fontFamily: DesignSystem.fontFamily,
                  fontWeight: FontWeight.bold),
            ),
          ),

        ],
      ),
    );
  }
}
