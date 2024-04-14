import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itds283_gr03_project_go_green_ezy_wheels/pages/pages.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';
import '../../constants/constants.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  final brandsOfCars = CarListMessage.brandsOfCars;
  List<String> selectCarBrand = [];
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
    final filterBrands = carsList.where((brand) {
      return selectCarBrand.isEmpty ||
          selectCarBrand.contains(brand.get('brand'));
    }).toList();

    return Scaffold(
      backgroundColor: DesignSystem.c4,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          CarListMessage.carList,
          style: TextStyle(
              fontFamily: DesignSystem.fontFamily, fontWeight: FontWeight.w700),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: DesignSystem.c4,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin:
                    const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 4,
                  children: brandsOfCars
                      .map(
                        (e) => FilterChip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            side: BorderSide.none,
                            selectedColor: DesignSystem.c5,
                            label: Text(
                              e,
                              style: TextStyle(
                                  color: DesignSystem.c0,
                                  fontFamily: DesignSystem.fontFamily),
                            ),
                            selected: selectCarBrand.contains(e),
                            onSelected: (value) {
                              setState(() {
                                if (value) {
                                  selectCarBrand.add(e);
                                } else {
                                  selectCarBrand.remove(e);
                                }
                              });
                            }),
                      )
                      .toList(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(3),
                  itemCount: filterBrands.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: DesignSystem.c1,
                      surfaceTintColor: DesignSystem.c1,
                      elevation: 3,
                      margin:
                          EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                      child: CustomListTileCarCard(
                        thumbnail: filterBrands[index].get('image'),
                        title: filterBrands[index].get('name'),
                        type: filterBrands[index].get('type'),
                        dc: filterBrands[index].get('dc'),
                        priceHour: filterBrands[index].get('priceHour'),
                        priceDay: filterBrands[index].get('priceDay'),
                        rage: filterBrands[index].get('rage'),
                        seat: filterBrands[index].get('seat'),
                        brand: filterBrands[index].get('brand'),
                        supercharge: filterBrands[index].get('superCharger'),
                        ac: filterBrands[index].get('ac'),
                        transmossion: filterBrands[index].get('transmossion'),
                        energyType: filterBrands[index].get('energyType'),
                        batteryLevel: filterBrands[index].get('batteryLevel'),
                        routePage: BookingCarRentalPage(
                          thumbnail: filterBrands[index].get('image'),
                          title: filterBrands[index].get('name'),
                          type: filterBrands[index].get('type'),
                          rage: filterBrands[index].get('rage'),
                          seat: filterBrands[index].get('seat'),
                          dc: filterBrands[index].get('dc'),
                          priceHour: filterBrands[index].get('priceHour'),
                          priceDay: filterBrands[index].get('priceDay'),
                          brand: filterBrands[index].get('brand'),
                          transmossion: filterBrands[index].get('transmossion'),
                          energyType: filterBrands[index].get('energyType'),
                          batteryLevel: filterBrands[index].get('batteryLevel'),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
