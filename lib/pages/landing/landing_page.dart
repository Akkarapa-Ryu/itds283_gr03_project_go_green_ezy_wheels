import 'dart:async';

import 'package:flutter/material.dart';
import '../../components/container_text.dart';
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
      const Duration(seconds: 3),
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
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: 
            textContainer(LandingMessage.ggew,DesignSystem.c3,FontWeight.bold,22)
          ),

        ],
      ),
    );
  }
}
