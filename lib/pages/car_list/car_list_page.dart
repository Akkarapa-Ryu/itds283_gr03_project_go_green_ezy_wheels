import 'dart:math';

import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../pages/pages.dart';
import '../../theme/theme.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage>
// with SingleTickerProviderStateMixin
{
  final brandsOfCars = ['Tesla', 'MG', 'BYD', 'Benz', 'MG', 'BYD', 'Benz'];
  List<String> selectCarBrand = [];

  // List<CarsModel> cars = [];
  // late TabController _tabController;

  // void _getCars() {
  //   cars = CarsModel.getCars();
  // }

  // @override
  // void initState() {
  //   _getCars();
  //   super.initState();
  //   _tabController = TabController(
  //     length: 8,
  //     vsync: this,
  //   );
  //   // _tabController.addListener(_hadleTabSelection);
  // }

  // void _hadleTabSelection(){
  //   if (_tabController.indexIsChanging){
  //     switch (_tabController.index) {
  //       case 0:
  //         filterData('all');
  //         break;
  //       default:
  //     }
  //   }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }

// https://www.fluttertemplates.dev/templates/01-custom-tabbars

  // TabBar get _tabBar => TabBar(
  //         padding: EdgeInsets.only(left: 5, top: 10, bottom: 5, right: 5),
  //         controller: _tabController,
  //         isScrollable: true,
  //         labelColor: DesignSystem.c0,
  //         dividerHeight: 0,
  //         unselectedLabelColor: DesignSystem.c0,
  //         indicatorSize: TabBarIndicatorSize.tab,
  //         indicator: BoxDecoration(
  //             borderRadius: BorderRadius.circular(50), color: DesignSystem.c1),
  //         tabAlignment: TabAlignment.start,
  //         tabs: [
  //           Tab(
  //             text: 'All',
  //           ),
  //           Tab(
  //             text: 'Tesla',
  //           ),
  //           Tab(
  //             text: 'MG',
  //           ),
  //           Tab(
  //             text: 'BYD',
  //           ),
  //           Tab(
  //             text: 'Benz',
  //           ),
  //           Tab(
  //             text: 'MG',
  //           ),
  //           Tab(
  //             text: 'BYD',
  //           ),
  //           Tab(
  //             text: 'Benz',
  //           ),
  //         ]);

  @override
  Widget build(BuildContext context) {
    final filterBrands = carsList.where((brand) {
      return selectCarBrand.isEmpty || selectCarBrand.contains(brand.brand);
    }).toList();
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Car List',
          style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w700),
        )),
        body: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: DesignSystem.c4,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  // PreferredSize(
                  //     preferredSize: _tabBar.preferredSize,
                  //     child: Material(
                  //       color: DesignSystem.c4,
                  //       borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(15),
                  //           topRight: Radius.circular(15)),
                  //       child: _tabBar,
                  //     )),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 10),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 4,
                        // https://www.youtube.com/watch?v=CSdYgI0kw-o
                        children: brandsOfCars
                            .map((e) => FilterChip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              side: BorderSide.none,
                              selectedColor: DesignSystem.c5,
                                label: Text(e,style: TextStyle(color: DesignSystem.c0,fontFamily: DesignSystem.fontFamily),),
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
                          elevation: 3,
                          margin: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          child: CustomListTile(
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

/*
  Widget? _carCard(context, index) {
    return Card(
        elevation: 3,
        margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        // color: DesignSystem.c1,
        // surfaceTintColor: DesignSystem.c2,
        shadowColor: DesignSystem.c0,
        child: CustomListTile(
          thumbnail: Image.asset(
            cars[index].image,
            height: 90,
            width: 150,
          ),
          title: cars[index].name,
          type: cars[index].type,
          dc: cars[index].dc,
          supercharge: cars[index].superCharger,
          ac: cars[index].ac,
          priceHour: cars[index].priceHour,
          priceDay: cars[index].priceDay,
          rage: cars[index].rage,
          seat: cars[index].seat,
          brand: cars[index].brand,
        ));
  }*/
}
