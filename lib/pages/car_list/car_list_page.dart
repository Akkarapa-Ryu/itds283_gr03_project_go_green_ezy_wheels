import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../pages/pages.dart';
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

  @override
  Widget build(BuildContext context) {
    final filterBrands = carsList.where((brand) {
      return selectCarBrand.isEmpty || selectCarBrand.contains(brand.brand);
    }).toList();
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          CarListMessage.carList,
          style: TextStyle(fontFamily: DesignSystem.fontFamily, fontWeight: FontWeight.w700),
        )),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: DesignSystem.c4,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 10),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 4,
                        // https://www.youtube.com/watch?v=CSdYgI0kw-o
                        children: brandsOfCars
                            .map((e) => FilterChip(
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
                                }))
                            .toList(),
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(3),
                      itemCount: filterBrands.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: DesignSystem.c1,
                          elevation: 3,
                          margin: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          child: CustomListTileCarCard(
                            thumbnail: Image.asset(
                              filterBrands[index].image,
                              height: 90,
                              width: 150,
                            ),
                            title: filterBrands[index].name,
                            type: filterBrands[index].type,
                            dc: filterBrands[index].dc,
                            priceHour: filterBrands[index].priceHour,
                            priceDay: filterBrands[index].priceDay,
                            rage: filterBrands[index].rage,
                            seat: filterBrands[index].seat,
                            brand: filterBrands[index].brand,
                            supercharge: filterBrands[index].superCharger,
                            ac: filterBrands[index].ac,
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
