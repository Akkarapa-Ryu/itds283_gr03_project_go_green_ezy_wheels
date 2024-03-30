import 'package:flutter/material.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/firebase_api/firebase_api.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/theme/design_system.dart';

import '../../components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi !!!',
                      style: TextStyle(
                          fontFamily: DesignSystem.fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Albert Flores',
                        style: TextStyle(
                            fontFamily: DesignSystem.fontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-photo/portrait-handsome-young-man_53876-38137.jpg?size=626&ext=jpg&ga=GA1.1.735520172.1711238400&semt=ais'),
                )
              ],
            ),
          ),
          Container(
            height: 550,
            decoration: BoxDecoration(
                color: DesignSystem.c4,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeMenuButton(
                      iconMenu: Icon(Icons.punch_clock_sharp),
                      text: 'Hour',
                    ),
                    HomeMenuButton(
                      iconMenu: Icon(Icons.sunny),
                      text: 'Day',
                    ),
                    HomeMenuButton(
                      iconMenu: Icon(Icons.calendar_month),
                      text: 'Long-Term',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeMenuButton(
                      iconMenu: Icon(Icons.charging_station),
                      text: 'EV Charger',
                    ),
                    /*
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TestPage()));
                    }, child: Icon(Icons.add,size: 100,))*/
                    // HomeMenuButton(iconMenu: Icon(Icons.car_rental), text: 'Van with Driver',),
                    // HomeMenuButton(iconMenu: Icon(Icons.car_repair_sharp), text: 'Premium car with Driver',),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
