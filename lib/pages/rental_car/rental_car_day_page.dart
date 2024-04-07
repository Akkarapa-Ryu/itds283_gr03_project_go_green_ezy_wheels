import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../constants/constants.dart';
import '../../theme/theme.dart';
import 'package:intl/intl.dart';

class RentalCarDayPage extends StatefulWidget {
  const RentalCarDayPage({super.key});

  @override
  State<RentalCarDayPage> createState() => _RentalCarDayPageState();
}

class _RentalCarDayPageState extends State<RentalCarDayPage> {
  List<QueryDocumentSnapshot> carsList = [];

  getDate() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('cars').get();

    carsList.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${RentalCarMessage.dayRental}'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 120,
            decoration: BoxDecoration(
                color: DesignSystem.c2,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
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
                      '${DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.now())}',
                      style: TextStyle(
                          color: DesignSystem.c1,
                          fontFamily: DesignSystem.fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: DesignSystem.c1,
                    ),
                    // https://stackoverflow.com/questions/64871346/flutter-how-to-show-current-date-and-next-5-day-dates
                    Text(
                      '${DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.now().add(Duration(days: 1)))}',
                      style: TextStyle(
                          color: DesignSystem.c1,
                          fontFamily: DesignSystem.fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${RentalCarMessage.totalResults}: ${carsList.length.toString()}',
            style: TextStyle(
                color: DesignSystem.c0,
                fontFamily: DesignSystem.fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(3),
                itemCount: carsList.length,
                itemBuilder: (context, index) {
                  return CustomListTileCarCard(
                    thumbnail: carsList[index].get('image'),
                    title: carsList[index].get('name'),
                    type: carsList[index].get('type'),
                    dc: carsList[index].get('dc'),
                    priceHour: carsList[index].get('priceHour'),
                    priceDay: carsList[index].get('priceDay'),
                    rage: carsList[index].get('rage'),
                    seat: carsList[index].get('seat'),
                    brand: carsList[index].get('brand'),
                    supercharge: carsList[index].get('superCharger'),
                    ac: carsList[index].get('ac'),
                  );
                }),
          )
        ],
      ),
    );
  }
}
