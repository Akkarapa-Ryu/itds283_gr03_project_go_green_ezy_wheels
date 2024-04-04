import 'package:flutter/material.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/main_page.dart';
import '/constants/constants.dart';
import '/theme/theme.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.fitWidth,width: double.maxFinite,
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 15,
            endIndent: 230,
            thickness: 4,
            color: DesignSystem.c8,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 17, right: 17, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  WelcomeMessage.welcome,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: DesignSystem.c0,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  WelcomeMessage.ggewMessage,
                  style: TextStyle(
                    fontSize: 16,
                    color: DesignSystem.c0,
                  ),
                ),

                SizedBox(height: 200,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: DesignSystem.c2,
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(WelcomeMessage.next,style: TextStyle(color: DesignSystem.c0,fontFamily: DesignSystem.fontFamily,fontWeight: FontWeight.w600,fontSize: 18),)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
