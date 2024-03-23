import 'package:flutter/material.dart';
import '../../pages/pages.dart';
import '../../theme/theme.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage>
    with SingleTickerProviderStateMixin {
  List<CarsModel> cars = [];
  late TabController _tabController;

  void _getCars() {
    cars = CarsModel.getCars();
  }

  @override
  void initState() {
    _getCars();
    super.initState();
    _tabController = TabController(
      length: 8,
      vsync: this,
    );
    // _tabController.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
// https://www.fluttertemplates.dev/templates/01-custom-tabbars
  TabBar get _tabBar => TabBar(
    padding: EdgeInsets.only(top: 10,bottom: 5),
          controller: _tabController,
          isScrollable: true,
          labelColor: DesignSystem.c0,
          dividerHeight: 0,
          unselectedLabelColor: DesignSystem.c0,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: DesignSystem.c1),
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Tesla',
            ),
            Tab(
              text: 'MG',
            ),
            Tab(
              text: 'BYD',
            ),
            Tab(
              text: 'Benz',
            ),
            Tab(
              text: 'MG',
            ),
            Tab(
              text: 'BYD',
            ),
            Tab(
              text: 'Benz',
            ),
          ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Car List',
          style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w700),
        )),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: DesignSystem.c4,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  PreferredSize(
                      preferredSize: _tabBar.preferredSize,
                      child: Material(
                        color: DesignSystem.c4,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: _tabBar,
                      )),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(3),
                      itemCount: cars.length,
                      itemBuilder: _carCard),
                ],
              ),
            ),
          ),
        ));
  }

  Widget? _carCard(context, index) {
    return Card(
        elevation: 3,
        margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
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
        ));
  }
}

// https://api.flutter.dev/flutter/material/ListTile-class.html
class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      // required this.image,
      required this.thumbnail,
      required this.title,
      required this.type,
      required this.dc,
      this.ac,
      this.supercharge,
      required this.priceHour,
      required this.priceDay,
      required this.rage,
      required this.seat});

  // final Image image;
  final Widget thumbnail;
  final String title; // name's car
  final String type; // type,
  final int rage;
  final String seat;
  final int dc; // dc
  final int? ac;
  final String? supercharge;
  final double priceHour;
  final double priceDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        height: 130,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      thumbnail,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text('$priceHour / Hour'),
                          Text('$priceDay / Day'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontFamily: DesignSystem.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Row(
                          children: [
                            Text(
                              'Type: $type  Rage: $rage  Seat: $seat',
                              style: TextStyle(
                                  fontFamily: DesignSystem.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'DC: $dc Kw/H',
                              style: TextStyle(
                                  fontFamily: DesignSystem.fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11),
                            ),
                            superchargeORac(supercharge, ac)
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              '      Select      ',
                              style: TextStyle(
                                  fontFamily: DesignSystem.fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: DesignSystem.c1),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: DesignSystem.c6))
                      ],
                    )))
          ],
        ),
      ),
    );
  }

// https://flutterdesk.com/show-conditional-widgets-in-flutter/
  superchargeORac(supercharge, ac) {
    if (supercharge != null) {
      return Text(
        ' ($supercharge)',
        style: TextStyle(
            fontFamily: DesignSystem.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 11),
      );
    } else if (ac != null) {
      return Text(
        '  AC: ' + ac.toString() + 'Kw/H',
        style: TextStyle(
            fontFamily: DesignSystem.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 11),
      );
    }
  }
}
