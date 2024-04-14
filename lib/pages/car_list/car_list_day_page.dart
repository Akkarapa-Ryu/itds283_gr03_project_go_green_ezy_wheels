import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';
import '../../constants/constants.dart';
import '../pages.dart';

class CarListDayPage extends StatefulWidget {
  const CarListDayPage({super.key});

  @override
  State<CarListDayPage> createState() => _CarListDayPageState();
}

class _CarListDayPageState extends State<CarListDayPage> {
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
      backgroundColor: DesignSystem.c1,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          CarListMessage.carList,
          style: TextStyle(
              fontFamily: DesignSystem.fontFamily, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          const ContainerLocationDateTimeWidget(),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(3),
                itemCount: carsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: DesignSystem.c1,
                    surfaceTintColor: DesignSystem.c1,
                    elevation: 3,
                    margin:
                        const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                    child: CustomListTileCarCard(
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
                      transmossion: carsList[index].get('transmossion'),
                      energyType: carsList[index].get('energyType'),
                      batteryLevel: carsList[index].get('batteryLevel'),
                      routePage: BookingDayCarRentalPage(
                        thumbnail: carsList[index].get('image'),
                        title: carsList[index].get('name'),
                        type: carsList[index].get('type'),
                        rage: carsList[index].get('rage'),
                        seat: carsList[index].get('seat'),
                        dc: carsList[index].get('dc'),
                        priceHour: carsList[index].get('priceHour'),
                        priceDay: carsList[index].get('priceDay'),
                        brand: carsList[index].get('brand'),
                        transmossion: carsList[index].get('transmossion'),
                        energyType: carsList[index].get('energyType'),
                        batteryLevel: carsList[index].get('batteryLevel'),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
